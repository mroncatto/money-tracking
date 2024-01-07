import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BalanceSeries {
  final String stage;
  final int percent;
  final charts.Color barColor;
  final Color color;

  BalanceSeries(
      {required this.stage,
      required this.percent,
      required this.barColor,
      required this.color});
}
