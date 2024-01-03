import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/pages/home/widget/flow_card.dart';
import 'package:money_tracking/util/formatHelper.dart';
import 'package:money_tracking/util/messages.dart';

class AccountsResum extends StatelessWidget {
  const AccountsResum({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Text(Messages.balance_available,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 14))),
          Padding(
              padding: const EdgeInsetsDirectional.only(top: 5),
              child: Text(
                FormatHelper.formatarMoeda(valor: 35000000),
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoMono(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // max 19 digitos
                FlowCard(
                    titulo: Messages.income, receita: true, valor: 10000000),
                FlowCard(
                    titulo: Messages.spent, receita: false, valor: 10000000),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
