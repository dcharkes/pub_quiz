import 'package:flutter/material.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';
import '../services/persistence_service.dart';

class JoinGameScreen extends StatefulWidget {
  final String gameId;
  final PersistenceService persistenceService;

  const JoinGameScreen({
    super.key,
    required this.gameId,
    required this.persistenceService,
  });

  @override
  State<JoinGameScreen> createState() => _JoinGameScreenState();
}

class _JoinGameScreenState extends State<JoinGameScreen> {
  final _controller = TextEditingController();

  Future<void> _join() async {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const PubQuizLogo(),
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
    );
  }
}
