import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';

import 'router.dart';
import 'src/services/persistence_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy(); // Removes the hash from the URL
  final persistenceService = await PersistenceService.init();
  runApp(MyApp(persistenceService: persistenceService));
}

class MyApp extends StatelessWidget {
  final PersistenceService persistenceService;

  const MyApp({
    super.key,
    required this.persistenceService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pub Quiz Player',
      theme: pubQuizThemeData,
      routerConfig: createRouter(persistenceService),
    );
  }
}
