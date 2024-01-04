import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/util/formatHelper.dart';
import 'package:money_tracking/util/messages.dart';

class MonthBalance extends StatelessWidget {
  const MonthBalance({super.key});
  
  @override
  Widget build(BuildContext context) {
    const double _receita = 200000;
    const double _gastos = 50000;
    const double _balance = _receita - _gastos;

    bool _isReceitaNegative() {
      return _balance < 0;
    }
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Messages.month_balance, style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Messages.income, style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45),),
            Text(FormatHelper.formatarMoeda(valor: _receita), style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Messages.spent, style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45),),
            Text(FormatHelper.formatarMoeda(valor: _gastos), style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),),
          ],
        ),
        Container(
          color: Colors.black26,
          height: 1,
          width: MediaQuery.of(context).size.width,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Messages.balance, style: GoogleFonts.baiJamjuree(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black45),),
            Text(FormatHelper.formatarMoeda(valor: _balance), style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.bold, color: _isReceitaNegative() ? Colors.red : Colors.green),),
          ],
        ),
      ],
    );
  }
}
