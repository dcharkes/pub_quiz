import 'package:flutter/material.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';

import '../services/fake_player_client.dart';

class GameOverScreen extends StatelessWidget {
  final GameResults results;

  const GameOverScreen({
    super.key,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Game Over')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PubQuizLogo(),
            const SizedBox(height: 32),
            const Text(
              'The game is over!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'You scored ${results.correctAnswers} out of ${results.totalAnswers}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
