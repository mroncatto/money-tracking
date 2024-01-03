import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/util/formatHelper.dart';

class FlowCard extends StatelessWidget {
  final String titulo;
  final bool receita;
  final double valor;

  const FlowCard({super.key, required this.titulo, required this.receita, required this.valor});

  double _getTextValueSize(double valor) {
    if (valor.round().toString().length > 13) return 8;
    return 34 - (valor.round().toString().length * 2);
  }


  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Icon(receita ? Icons.arrow_circle_up : Icons.arrow_circle_down,
              color: receita ? Colors.green : Colors.red, size: 44),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: GoogleFonts.poppins(fontSize: 16)),
              Text(
                FormatHelper.formatarMoeda(valor: valor),
                style: TextStyle(color: receita ? Colors.green : Colors.red, fontSize: _getTextValueSize(valor), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
    );
  }

}
