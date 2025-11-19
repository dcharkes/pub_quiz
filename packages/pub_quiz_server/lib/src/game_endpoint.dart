import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';
import 'topics.dart';

class GameEndpoint extends Endpoint {
  Future<int> startGame(Session session, int quizId) async {
    final game = await Game.db.insertRow(
      session,
      Game(
        currentQuestion: -1,
        quizId: quizId,
        questionStart: DateTime.fromMicrosecondsSinceEpoch(0),
        deadline: DateTime.fromMicrosecondsSinceEpoch(0),
      ),
    );
    final gameId = game.id!;
    await session.messages.postMessage(
      Topics.game(gameId),
      GameEvent(game: game, type: GameEventType.start),
    );
    return gameId;
  }

  Future<void> setQuestion(
    Session session,
    int gameId,
    int questionIndex,
    Duration duration,
  ) async {
    final game = await Game.db.findById(session, gameId);
    if (game == null) {
      throw Exception('Game not found');
    }
    final now = DateTime.now();
    final updatedGame = await Game.db.updateRow(
      session,
      game.copyWith(
        currentQuestion: questionIndex,
        deadline: now.add(duration),
        questionStart: now,
      ),
    );
    await session.messages.postMessage(
      Topics.game(gameId),
      GameEvent(game: updatedGame, type: GameEventType.question),
    );
  }

  Future<GameResult> finishGame(Session session, int gameId) async {
    final game = await Game.db.findById(
      session,
      gameId,
      include: Game.include(quiz: Quiz.include()),
    );
    if (game == null) {
      throw Exception('Game not found');
    }
    final updatedGame = await Game.db.updateRow(
      session,
      game.copyWith(
        currentQuestion: game.quiz!.questions.length,
        deadline: DateTime.fromMicrosecondsSinceEpoch(0),
        questionStart: DateTime.fromMicrosecondsSinceEpoch(0),
      ),
    );
    await session.messages.postMessage(
      Topics.game(gameId),
      GameEvent(game: updatedGame, type: GameEventType.end),
    );

    return GameResult(
      scores: (await Game.db.findById(
        session,
        gameId,
        include: Game.include(players: Player.includeList()),
      ))!.players!,
    );
  }
}
