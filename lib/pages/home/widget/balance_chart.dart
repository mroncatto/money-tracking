import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:money_tracking/commons/enums/balance_series.dart';

class BalanceChart extends StatelessWidget {
  final List<BalanceSeries> data;

  const BalanceChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BalanceSeries, String>> series = [
      charts.Series(
          id: "stages",
          data: data,
          domainFn: (BalanceSeries series, _) => series.stage,
          measureFn: (BalanceSeries series, _) => series.percent,
          colorFn: (BalanceSeries series, _) => series.barColor)
    ];
    return charts.PieChart(series, animate: true);
  }
}