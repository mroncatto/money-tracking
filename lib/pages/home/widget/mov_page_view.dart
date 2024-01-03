import 'package:flutter/cupertino.dart';
import 'package:money_tracking/pages/home/widget/card_view.dart';
import 'package:money_tracking/pages/home/widget/pending_mov_card.dart';

class MovementsPageView extends StatelessWidget {
  final ValueChanged<int> onChanged;

  const MovementsPageView({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      onPageChanged: onChanged,
      children: const [
        CustomCardView(
          child: PendingMovement(receita: true, valor: 4220000, movCount: "2",),
        ),
        CustomCardView(
          child: PendingMovement(receita: false, valor: 220000, movCount: "5",),
        )
      ],
    );
  }
}
