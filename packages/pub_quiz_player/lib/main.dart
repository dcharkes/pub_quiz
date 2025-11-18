import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'firebase_options.dart';
import 'router.dart';
import 'src/services/persistence_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy(); // Removes the hash from the URL
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final persistenceService = await PersistenceService.init();
  runApp(MyApp(persistenceService: persistenceService));
}

class MyApp extends StatelessWidget {
  final PersistenceService persistenceService;
  final FirebaseFirestore? firestore;

  const MyApp({
    super.key,
    required this.persistenceService,
    this.firestore,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pub Quiz Player',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      routerConfig: createRouter(persistenceService, firestore: firestore),
    );
  }
}
