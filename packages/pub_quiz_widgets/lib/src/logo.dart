import 'package:flutter/material.dart';

class PubQuizLogo extends StatelessWidget {
  final double? fontSize;

  const PubQuizLogo({this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displayLarge!.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/pubquiz.png',
          package: 'pub_quiz_widgets',
          height: (textStyle.fontSize ?? 64) * 1.2,
        ),
        SizedBox(width: (textStyle.fontSize ?? 64) * 0.25),
        Text('pub.quiz', style: textStyle),
      ],
    );
  }
}
