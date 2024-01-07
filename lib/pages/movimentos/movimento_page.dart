import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/commons/enums/tipo_movimento_caixa.dart';
import 'package:money_tracking/pages/movimentos/widget/item_lista_movimento.dart';
import 'package:money_tracking/util/format_helper.dart';

class MovimentoPage extends StatefulWidget {
  const MovimentoPage({super.key});

  @override
  State<MovimentoPage> createState() => _MovimentoPageState();
}

class _MovimentoPageState extends State<MovimentoPage> {
  TipoMovCaixa tipoSelected = TipoMovCaixa.Gastos;
  DateTime _selected = DateTime.timestamp();

  Future<void> _onPressed({required BuildContext context}) async {
    final selected = await showMonthPicker(
        context: context,
        initialDate: _selected,
        firstDate: DateTime(2000),
        lastDate: DateTime(2033));
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }

  void _changeMonth(bool increase) {
    setState(() {
      _selected = DateUtils.addMonthsToMonthDate(
          DateTime(_selected.year, _selected.month, 1), increase ? 1 : -1);
    });
  }

  Color getColorHeader() {
    if (tipoSelected.isGastos()) return Colors.red;
    if (tipoSelected.isReceitas()) return Colors.green;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    final alturaTela = MediaQuery.of(context).size.height;

    return Container(
        //padding: const EdgeInsets.only(top: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        color: getColorHeader(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: GestureDetector(
                onTap: () => _changeMonth(false),
                child: const Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 30),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              margin: const EdgeInsets.fromLTRB(40, 5, 40, 5),
              child: GestureDetector(
                onTap: () => _onPressed(context: context),
                child: Text(FormatHelper.getMonthName(monthNumber: _selected.month),
                    style: GoogleFonts.baiJamjuree(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40),
              child: GestureDetector(
                onTap: () => _changeMonth(true),
                child: const Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30),
              ),
            ),
            //GestureDetector(),
          ],
        ),
      ),
      Container(
          color: getColorHeader(),
          width: larguraTela,
          child: DropdownButton<TipoMovCaixa>(
              value: tipoSelected,
              padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
              style: GoogleFonts.baiJamjuree(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              dropdownColor: getColorHeader(),
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Colors.white, size: 25),
              elevation: 16,
              items: TipoMovCaixa.values.map((TipoMovCaixa tipo) {
                return DropdownMenuItem<TipoMovCaixa>(
                    value: tipo,
                    child: Text(
                      tipo.desc,
                      style: GoogleFonts.notoSans(),
                    ));
              }).toList(),
              onChanged: (TipoMovCaixa? value) {
                setState(() {
                  tipoSelected = value!;
                });
              })),
      Container(
          color: getColorHeader(),
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, left: 25, bottom: 10, right: 25),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total Pendente",
                        style: GoogleFonts.baiJamjuree(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                            fontSize: 18)),
                    Text("G\$ 100.000.000",
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 15))
                  ],
                ),
                Column(
                  children: [
                    Text("Total pago",
                        style: GoogleFonts.baiJamjuree(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                            fontSize: 18)),
                    Text("G 100.000.000",
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 15))
                  ],
                )
              ],
            ),
          )),
      Expanded(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) =>
                  ItemListaMovimento(index: index)),
        ),
      ),
    ]));
  }
}
