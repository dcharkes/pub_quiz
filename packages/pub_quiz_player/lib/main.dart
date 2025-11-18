import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Counter',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const GlobalCounterPage(),
    );
  }
}

class GlobalCounterPage extends StatelessWidget {
  const GlobalCounterPage({super.key});

  // This helper function handles the button press
  Future<void> _incrementCounter() async {
    final docRef = FirebaseFirestore.instance
        .collection('app_data')
        .doc('global_counter');

    // We use FieldValue.increment(1) instead of reading the value and adding 1.
    // This is an "Atomic Operation". It ensures that if 100 people click at
    // the exact same time, the counter goes up by 100, not just 1.
    // SetOptions(merge: true) ensures we create the document if it doesn't exist.
    await docRef.set({
      'count': FieldValue.increment(1),
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Global Firebase Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Global clicks across the world:'),
            const SizedBox(height: 20),

            // STREAMBUILDER: This is the magic part.
            // It listens to the database. Whenever the database changes,
            // this widget rebuilds automatically with the new data.
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('app_data')
                  .doc('global_counter')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                // Get data safely
                final data = snapshot.data?.data() as Map<String, dynamic>?;
                final count = data?['count'] ?? 0; // Default to 0 if null

                return Text(
                  '$count',
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
