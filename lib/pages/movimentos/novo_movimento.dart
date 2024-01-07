import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracking/commons/enums/tipo_movimento.dart';
import 'package:money_tracking/commons/enums/tipo_movimento_caixa.dart';

class NovoMovimento extends StatefulWidget {
  const NovoMovimento({super.key, required this.tipoMovimento, required this.tipoMovCaixa});
  final TipoMovimento tipoMovimento;
  final TipoMovCaixa tipoMovCaixa;

  @override
  State<NovoMovimento> createState() => _NovoMovimentoState();
}

class _NovoMovimentoState extends State<NovoMovimento> {

  Color getColorHeader() {
    if (widget.tipoMovCaixa.isGastos()) return Colors.red;
    if (widget.tipoMovCaixa.isReceitas()) return Colors.green;
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("New Expense", style: GoogleFonts.baiJamjuree(color: Colors.white, fontSize: 18, fontStyle: FontStyle.normal, fontWeight: FontWeight.w600)),
        backgroundColor: getColorHeader(),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 5),
            color: getColorHeader(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Valor"),
                    Text("0.00"),
                  ],
                ),
                Text("Moeda ??")
              ],
            ),
          )
        ],
      ),
    );
  }
}
