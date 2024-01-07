import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceChartLegend extends StatelessWidget {
  final Color color;
  final String area;

  const BalanceChartLegend({Key? key, required this.color, required this.area})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: color,
              width: 15,
              height: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              area,
              style: GoogleFonts.baiJamjuree(color: Colors.grey.shade600, fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}