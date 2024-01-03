import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/util/formatHelper.dart';
import 'package:money_tracking/util/messages.dart';

class PendingMovement extends StatelessWidget {
  final bool receita;
  final double valor;
  final String movCount;

  const PendingMovement(
      {super.key,
      required this.receita,
      required this.valor,
      required this.movCount});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: receita ? Colors.green : Colors.red,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                receita
                    ? Icons.keyboard_arrow_up_sharp
                    : Icons.keyboard_arrow_down_sharp,
                color: Colors.white,
                size: 40,
              ),
              Text(
                receita ? Messages.pending_recipes : Messages.pending_pay,
                style: GoogleFonts.notoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          Text(
            FormatHelper.formatarMoeda(valor: valor),
            style: GoogleFonts.robotoMono(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text("$movCount ${Messages.pending_movements}",
              style: GoogleFonts.notoSans(
                  color: Colors.white54, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
