import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final String gameId;
  final String playerName;
  final FirebaseFirestore firestore;

  GameScreen({
    super.key,
    required this.gameId,
    required this.playerName,
    FirebaseFirestore? firestore,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> _incrementCounter() async {
    final docRef = firestore.collection('app_data').doc('game_$gameId');

    await docRef.set({
      'count': FieldValue.increment(1),
    }, SetOptions(merge: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, $playerName!')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Game ID: $gameId'),
            const SizedBox(height: 20),
            const Text('Clicks for this game:'),
            const SizedBox(height: 20),
            StreamBuilder<DocumentSnapshot>(
              stream: firestore
                  .collection('app_data')
                  .doc('game_$gameId')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                final data = snapshot.data?.data() as Map<String, dynamic>?;
                final count = data?['count'] ?? 0;

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
