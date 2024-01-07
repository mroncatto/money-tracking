import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemListaMovimento extends StatefulWidget {
  const ItemListaMovimento({super.key, required this.index});

  final int index;

  @override
  State<ItemListaMovimento> createState() => _ItemListaMovimentoState();
}

class _ItemListaMovimentoState extends State<ItemListaMovimento> {
  List<int> items = List<int>.generate(100, (int index) => index);

  bool isOdd() {
    return widget.index % 2 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey<int>(items[widget.index]),
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction) {
        setState(() {
          items.removeAt(widget.index);
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        //decoration: BoxDecoration(color: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Viernes, 5 de Enero, 14:23",
              style: GoogleFonts.baiJamjuree(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                  fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: isOdd() ? Colors.orange : Colors.blue,
                        child: Icon(
                          isOdd()
                              ? CupertinoIcons.car_detailed
                              : CupertinoIcons.shopping_cart,
                          color: Colors.white,
                          size: 28,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(isOdd() ? "Troca de Oleo" : "Compras",
                              style: GoogleFonts.baiJamjuree(fontSize: 16)),
                          Row(
                            children: [
                              Text(isOdd() ? "Mecanica" : "Mercado",
                                  style: GoogleFonts.baiJamjuree(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              Text(" | ",
                                  style: GoogleFonts.baiJamjuree(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              Text("Itau Ahorro Guaranies",
                                  style: GoogleFonts.baiJamjuree(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(isOdd() ? "G\$ 250.000" : "G\$ 1.500.000",
                        style: GoogleFonts.notoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 22,
                    )
                  ],
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  "Observacao sobre a transacao",
                  style: GoogleFonts.baiJamjuree(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
