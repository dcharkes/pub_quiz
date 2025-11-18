import 'package:flutter/material.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: pubQuizThemeData,
    home: const Scaffold(body: Center(child: PubQuizLogo())),
  );
}
