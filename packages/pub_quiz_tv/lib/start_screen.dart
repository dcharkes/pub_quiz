import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final String pin;

  const StartScreen({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Game PIN:',
              style: textTheme.displaySmall,
            ),
            Text(
              pin,
              style: textTheme.displayLarge,
            ),
            const Spacer(),
            Text(
              'Waiting for players...',
              style: textTheme.displayLarge,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
