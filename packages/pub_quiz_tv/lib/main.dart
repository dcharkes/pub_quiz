import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:pub_quiz_shared/urls.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';

import 'client_provider.dart';
import 'code_screen.dart';
import 'start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy(); // Removes the hash from the URL
  final client = Client(serverUrl);

  runApp(
    ClientProvider(
      client: client,
      child: const MyApp(),
    ),
  );
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
        return StartScreen(pin: int.parse(state.pathParameters['pin']!));
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: pubQuizThemeData,
      darkTheme: pubQuizThemeData,
      routerConfig: _router,
    );
  }
}
