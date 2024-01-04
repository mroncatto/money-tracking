import 'package:flutter/material.dart';

class PageViewDots extends StatelessWidget {
  final int currentIndex;
  final int itens;

  Color getColor(int index) {
    return index == currentIndex ? Colors.green : Colors.greenAccent;
  }

  const PageViewDots({super.key, required this.currentIndex, required this.itens});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
            itens, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 7,
            width: 7,
            margin: const EdgeInsets.only(left: 2, right: 2),
            decoration: BoxDecoration(color: getColor(index), shape: BoxShape.circle),
          );
    })
        /*AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(color: getColor(0), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 8,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(color: getColor(1), shape: BoxShape.circle),
        ),
        const SizedBox(
          width: 8,
        )*/
    );
  }
}
