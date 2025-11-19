import 'package:flutter/material.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';
import '../services/fake_player_client.dart';
import '../services/persistence_service.dart';

class JoinGameScreen extends StatefulWidget {
  final String gameId;
  final PersistenceService persistenceService;
  final PlayerClient client;

  const JoinGameScreen({
    super.key,
    required this.gameId,
    required this.persistenceService,
    required this.client,
  });

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {
  final _controller = TextEditingController();

  Future<void> _join() async {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      await widget.client.join(name);
      await widget.persistenceService.saveGameState(widget.gameId, name);
      // Router will refresh automatically due to refreshListenable
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Join Game: ${widget.gameId}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PubQuizLogo(),
                const SizedBox(height: 16),
                Text(
                  widget.client.quizDescription.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(),
                  ),
                  onSubmitted: (_) => _join(),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: _join,
                  child: const Text('Join'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
