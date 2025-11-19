import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';

import 'code_screen.dart';
import 'start_screen.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CodeScreen(),
    ),
    GoRoute(
      path: '/game/:pin',
      builder: (context, state) {
        return StartScreen(pin: state.pathParameters['pin']!);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    theme: pubQuizThemeData,
    darkTheme: pubQuizThemeData,
    routerConfig: _router,
  );
}
