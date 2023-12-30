import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final Widget child;
  const CustomCardView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: child,
      );
  }
}
