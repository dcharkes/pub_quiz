import 'package:flutter/material.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';

class GameOverScreen extends StatelessWidget {
  final GameResult result;
  final int myPlayerId;

  const GameOverScreen({
    super.key,
    required this.result,
    required this.myPlayerId,
  });

  @override
  Widget build(BuildContext context) {
    final sortedScores = List.of(result.scores)
      ..sort((a, b) => b.score.compareTo(a.score));

    final myIndex = sortedScores.indexWhere((p) => p.id == myPlayerId);
    final windowSize = 10;
    int start = 0;
    if (sortedScores.length > windowSize) {
      start = myIndex - (windowSize ~/ 2);
      if (start < 0) start = 0;
      if (start + windowSize > sortedScores.length) {
        start = sortedScores.length - windowSize;
      }
    }

    final visibleScores = sortedScores.skip(start).take(windowSize).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Game Over')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PubQuizLogo(),
              const SizedBox(height: 32),
              const Text(
                'Leaderboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: visibleScores.length,
                  itemBuilder: (context, index) {
                    final player = visibleScores[index];
                    final rank = start + index + 1;
                    final isMe = player.id == myPlayerId;

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isMe
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHighest,
                        foregroundColor: isMe
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurfaceVariant,
                        child: Text('$rank'),
                      ),
                      title: Text(
                        player.name,
                        style: TextStyle(
                          fontWeight: isMe
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      trailing: Text(
                        '${player.score}',
                        style: TextStyle(
                          fontWeight: isMe
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
