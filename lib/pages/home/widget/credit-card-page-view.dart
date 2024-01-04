import 'package:flutter/cupertino.dart';
import 'package:money_tracking/model/credit_card.dart';
import 'package:money_tracking/pages/home/widget/credit_card_card.dart';
import 'package:money_tracking/pages/home/widget/page_view_dots.dart';

import 'card_view.dart';

class CreditCardPageView extends StatelessWidget {
  final ValueChanged<int> onChanged;

  const CreditCardPageView({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    List<CreditCard> _cartoes = [];
    _cartoes.add(CreditCard("VISA", "Itau", "5336", 10000000, "G\$"));
    _cartoes.add(CreditCard("Master Card", "Itau", "8264", 1700000, "G\$"));

    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        onPageChanged: onChanged,
        itemCount: _cartoes.length,
        itemBuilder: (BuildContext context, int index) {
          return CustomCardView(
              child: CreditCardCard(
                  cartao:
                      "${_cartoes[index].bandeira} **** ${_cartoes[index].numeroFinal}",
                  limite: _cartoes[index].limite,
                  valorFatura: 0,
                  dividaTotal: 0));
        });
  }
}
