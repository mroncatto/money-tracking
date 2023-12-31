import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/pages/home/widget/flow_card.dart';
import 'package:money_tracking/util/messages.dart';

import '../../../util/format_helper.dart';

class AccountsResum extends StatelessWidget {
  const AccountsResum({super.key, required this.totalReceita, required this.totalGasto, required this.saldoContas});
  final double totalReceita;
  final double totalGasto;
  final double saldoContas;


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Text(Messages.balance_available,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black45))),
          Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Text(
                FormatHelper.formatarMoeda(valor: saldoContas),
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // max 19 digitos
                FlowCard(
                    titulo: Messages.income, receita: true, valor: totalReceita),
                FlowCard(
                    titulo: Messages.spent, receita: false, valor: totalGasto),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
