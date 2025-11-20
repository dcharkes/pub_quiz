import 'package:flutter/material.dart';
import '../services/fake_player_client.dart';
import '../services/persistence_service.dart';
import 'game_screen.dart';
import 'join_game_screen.dart';

class GameOrJoinScreen extends StatefulWidget {
  final String gameId;
  final PersistenceService persistenceService;

  const GameOrJoinScreen({
    super.key,
    required this.gameId,
    required this.persistenceService,
  });

  @override
  State<GameOrJoinScreen> createState() => _GameOrJoinScreenState();
}

class _GameOrJoinScreenState extends State<GameOrJoinScreen> {
  late Future<PlayerClient> _clientFuture;

  @override
  void initState() {
    super.initState();
    _clientFuture = connectRealClient(int.parse(widget.gameId));
  }

  @override
  void didUpdateWidget(covariant GameOrJoinScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gameId != widget.gameId) {
      _disposeClient();
      _clientFuture = connectRealClient(int.parse(widget.gameId));
    }
  }

  @override
  void dispose() {
    _disposeClient();
    super.dispose();
  }

  void _disposeClient() {
    _clientFuture.then((client) => client.dispose()).catchError((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PlayerClient>(
      future: _clientFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error connecting: ${snapshot.error}')),
          );
        }

        final client = snapshot.data!;

        return ListenableBuilder(
          listenable: widget.persistenceService,
          builder: (context, _) {
            final savedGameId = widget.persistenceService.savedGameId;
            final savedPlayerName = widget.persistenceService.savedPlayerName;
            final savedPlayerId = widget.persistenceService.savedPlayerId;

            if (savedGameId == widget.gameId &&
                savedPlayerName != null &&
                savedPlayerName.isNotEmpty &&
                savedPlayerId != null) {
              client.playerId = savedPlayerId;
              return GameScreen(
                client: client,
              );
            }

            return JoinGameScreen(
              gameId: widget.gameId,
              persistenceService: widget.persistenceService,
              client: client,
            );
          },
        );
      },
    );
  }
}
