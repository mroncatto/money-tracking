import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/commons/enums/balance_series.dart';
import 'package:money_tracking/pages/home/widget/balance_chart.dart';
import 'package:money_tracking/pages/home/widget/balance_chart_legend.dart';
import 'package:money_tracking/util/format_helper.dart';
import 'package:money_tracking/util/messages.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MonthBalance extends StatelessWidget {
  const MonthBalance(
      {super.key, required this.totalReceita, required this.totalGasto});

  final double totalReceita;
  final double totalGasto;

  @override
  Widget build(BuildContext context) {
    List<BalanceSeries> data = [
      BalanceSeries(
          stage: Messages.spent,
          percent: totalGasto.toInt(),
          barColor: charts.ColorUtil.fromDartColor(Colors.red),
          color: Colors.red),
      BalanceSeries(
          stage: Messages.income,
          percent: totalReceita.toInt(),
          barColor: charts.ColorUtil.fromDartColor(Colors.green),
          color: Colors.green)
    ];

    double _balance() {
      return totalReceita - totalGasto;
    }

    bool _isReceitaNegative() {
      return _balance() < 0;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Messages.month_balance,
          style: GoogleFonts.baiJamjuree(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Messages.income,
              style: GoogleFonts.baiJamjuree(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            Text(
              FormatHelper.formatarMoeda(valor: totalReceita),
              style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Messages.spent,
              style: GoogleFonts.baiJamjuree(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            Text(
              FormatHelper.formatarMoeda(valor: totalGasto),
              style: GoogleFonts.notoSans(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
            ),
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
            Text(
              Messages.balance,
              style: GoogleFonts.baiJamjuree(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            ),
            Text(
              FormatHelper.formatarMoeda(valor: _balance()),
              style: GoogleFonts.notoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _isReceitaNegative() ? Colors.red : Colors.green),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var item in data)
                            BalanceChartLegend(
                                color: item.color, area: item.stage)
                        ],
                      )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 180,
                  child: BalanceChart(data: data),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
