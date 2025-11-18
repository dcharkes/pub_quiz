import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/persistence_service.dart';
import 'game_screen.dart';
import 'join_game_screen.dart';

class GameOrJoinScreen extends StatelessWidget {
  final String gameId;
  final PersistenceService persistenceService;
  final FirebaseFirestore firestore;

  const GameOrJoinScreen({
    super.key,
    required this.gameId,
    required this.persistenceService,
    required this.firestore,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: persistenceService,
      builder: (context, _) {
        final savedGameId = persistenceService.savedGameId;
        final savedPlayerName = persistenceService.savedPlayerName;

        if (savedGameId == gameId &&
            savedPlayerName != null &&
            savedPlayerName.isNotEmpty) {
          return GameScreen(
            gameId: gameId,
            playerName: savedPlayerName,
            firestore: firestore,
          );
        }

        return JoinGameScreen(
          gameId: gameId,
          persistenceService: persistenceService,
        );
      },
    );
  }
}
