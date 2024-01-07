import 'package:flutter/cupertino.dart';
import 'package:money_tracking/commons/enums/cartao_bandeira.dart';
import 'package:money_tracking/model/cartao_credito.dart';
import 'package:money_tracking/pages/home/widget/credit_card_card.dart';

import 'card_view.dart';

class CreditCardPageView extends StatelessWidget {
  final ValueChanged<int> onChanged;

  const CreditCardPageView({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    List<CartaoCredito> _cartoes = [];
    _cartoes.add(CartaoCredito(CartaoBandeira.Visa, "Itau", "5336", 10000000, "G\$"));
    _cartoes.add(CartaoCredito(CartaoBandeira.MasterCard, "Itau", "8264", 1700000, "G\$"));

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
