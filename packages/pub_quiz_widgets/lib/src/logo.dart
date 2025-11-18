import 'package:flutter/material.dart';

class PubQuizLogo extends StatelessWidget {
  final double? fontSize;

  const PubQuizLogo({this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'pub.quiz',
      style: TextTheme.of(
        context,
      ).displayLarge!.copyWith(fontSize: fontSize, fontWeight: FontWeight.w600),
    );
  }
}
