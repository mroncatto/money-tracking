import 'package:flutter/material.dart';

class PageViewDots extends StatelessWidget {
  final int currentIndex;

  Color getColor(int index) {
    return index == currentIndex ? Colors.green : Colors.greenAccent;
  }

  const PageViewDots({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
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
        )
      ],
    );
  }
}
