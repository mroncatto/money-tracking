import 'package:flutter/cupertino.dart';
import 'package:money_tracking/pages/home/widget/credit_card_card.dart';

import 'card_view.dart';

class CreditCardPageView extends StatelessWidget {
  final ValueChanged<int> onChanged;
  const CreditCardPageView({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      onPageChanged: onChanged,
      children: const [
        CustomCardView(
          child: CreditCardCard(cartao: "Visa Classic **** 4252", limiteDisponivel: 7200000, valorFatura: 2100000, dividaTotal: 3700000)
        ),
        CustomCardView(
            child: CreditCardCard(cartao: "Visa Gold **** 5202", limiteDisponivel: 10000000, valorFatura: 2100000, dividaTotal: 3700000)
        )
      ],
    );
  }
}

