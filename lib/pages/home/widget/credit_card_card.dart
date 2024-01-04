import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/pages/home/enums/credit-card-bill-state.dart';
import 'package:money_tracking/util/formatHelper.dart';
import 'package:money_tracking/util/messages.dart';


class CreditCardCard extends StatefulWidget {
  const CreditCardCard({super.key, required this.cartao, required this.limite, required this.valorFatura, required this.dividaTotal});
  final String cartao;
  final double limite, valorFatura, dividaTotal;

  @override
  State<CreditCardCard> createState() => _CreditCardCardState();
}

class _CreditCardCardState extends State<CreditCardCard> {
  CreditCardBillState billState = CreditCardBillState.Aberta;


  double _limiteDispBar(double limite, double divida) {
    final double porcentaje = (divida / limite);
    const double altura = 200;
    print(porcentaje);
    if(porcentaje > 1) return altura;
    if(porcentaje < 0) return 0;
    return altura * porcentaje;
  }

  double _dividaTotalBar(double limite, double divida) {
    final double porcentaje = 1 - (divida / limite);
    const double altura = 200;
    print(porcentaje);
    if(porcentaje > 1) return altura;
    if(porcentaje < 0) return 0;
    return altura * porcentaje;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SegmentedButton<CreditCardBillState>(
              segments: const <ButtonSegment<CreditCardBillState>>[
                ButtonSegment<CreditCardBillState>(
                    value: CreditCardBillState.Aberta,
                    label: Text("Aberta")),
                ButtonSegment<CreditCardBillState>(
                    value: CreditCardBillState.Fechada,
                    label: Text("Fechada")),
              ],
              selected: <CreditCardBillState>{billState},
              onSelectionChanged: (Set<CreditCardBillState> newSelection) {
                setState(() {
                  billState = newSelection.first;
                });
              },
              selectedIcon: const Icon(Icons.credit_card_rounded),
              style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return Colors.white;
                      }
                      return Colors.blue;
                    }),
                visualDensity:
                const VisualDensity(horizontal: -3, vertical: -3),
                backgroundColor:
                MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.blue.withOpacity(0.5);
                    }
                    if(states.contains(MaterialState.selected)) {
                      return Colors.blue;
                    }
                    return null; // Use the component's default.
                  },
                ),
              )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(widget.cartao,
                    style: GoogleFonts.notoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(Messages.availableLimit, style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(FormatHelper.formatarMoeda(valor: widget.limite), style: GoogleFonts.notoSans(
                        fontSize: 30,
                        color: Colors.greenAccent)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(Messages.invoiceValue, style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(FormatHelper.formatarMoeda(valor: widget.valorFatura), style: GoogleFonts.notoSans(
                        fontSize: 25,
                        color: Colors.redAccent)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(Messages.totalDebt, style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(FormatHelper.formatarMoeda(valor: widget.dividaTotal), style: GoogleFonts.notoSans(
                        fontSize: 25,
                        color: Colors.redAccent)
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Colors.red,
                    child: SizedBox(
                      width: 8,
                      height: _limiteDispBar(widget.limite, widget.dividaTotal),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: SizedBox(
                      width: 8,
                      height: _dividaTotalBar(widget.limite, widget.dividaTotal),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}