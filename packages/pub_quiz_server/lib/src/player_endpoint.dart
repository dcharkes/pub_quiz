import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';
import 'topics.dart';

class PlayerEndpoint extends Endpoint {
  Future<int> joinGame(Session session, int gameId, String name) async {
    final game = await Game.db.findById(
      session,
      gameId,
      include: Game.include(quiz: Quiz.include()),
    );
    if (game == null) {
      throw Exception('Game not found');
    }
    final player = await Player.db.insertRow(
      session,
      Player(name: name, gameId: gameId, score: 0),
    );

    unawaited(
      session.messages.postMessage(
        Topics.game(gameId),
        GameEvent(
          type: GameEventType.player_joined,
          game: game,
          player: player,
        ),
      ),
    );

    return player.id!;
  }

  Future<int> recordAnswer(
    Session session,
    int playerId,
    int questionIndex,
    int answerIndex,
    DateTime answerTime,
  ) async {
    final player = await Player.db.findById(
      session,
      playerId,
      include: Player.include(game: Game.include(quiz: Quiz.include())),
    );
    if (player == null) {
      throw Exception('Player not found');
    }

    // Check if the answer is right.
    final game = player.game!;
    final score = _getScore(
      game,
      questionIndex,
      answerIndex,
      answerTime,
    );

    final updatedPlayer = score != 0
        ? await Player.db.updateRow(
            session,
            player.copyWith(score: player.score + score),
          )
        : player;

    // To push to the TV.
    await session.messages.postMessage(
      Topics.game(game.id!),
      GameEvent(
        type: GameEventType.player_answered,
        game: game,
        player: updatedPlayer,
      ),
    );
    print('posted player_answered event for player ${updatedPlayer.id}');

    return score;
  }

  int _getScore(
    Game game,
    int questionIndex,
    int answerIndex,
    DateTime answerTime,
  ) {
    if (questionIndex != game.currentQuestion) {
      // No score for cheaters.
      return 0;
    }

    final answers = game.quiz!.questions[questionIndex].answers;
    if (answerIndex >= answers.length || !answers[answerIndex].correct) {
      // No score update.
      return 0;
    }

    if (!answerTime.isBefore(game.deadline)) {
      // No score after a deadline.
      return 0;
    }

    // User gets 500 points for the correct answer + 500 points depending
    // on the time left.
    final questionDuration = game.deadline
        .difference(game.questionStart)
        .inMicroseconds;
    final timeLeft = game.deadline.difference(answerTime).inMicroseconds;
    return 500 + (timeLeft * 500 ~/ questionDuration);
  }

  Stream<LiveQuestion> getQuestions(Session session, int gameId) async* {
    // First we need to fetch the game anyway, as it might be already
    // running and we cannot rely on events.
    final game = await Game.db.findById(
      session,
      gameId,
      include: Game.include(quiz: Quiz.include()),
    );
    if (game == null) {
      throw Exception('Game not found');
    }

    if (game.currentQuestion != -1) {
      // Return the current question.
      yield LiveQuestion(
        question: game.quiz!.questions[game.currentQuestion],
        index: game.currentQuestion,
        startedAt: game.questionStart,
        deadline: game.deadline,
      );
    }

    final controller = StreamController<LiveQuestion>();

    void onGameEvent(SerializableModel message) {
      if (message is! GameEvent) {
        controller.addError(
          'Wrong message: $message (${message.runtimeType})',
        );
        return;
      }

      if (message.type == GameEventType.question) {
        if (message.game.currentQuestion == game.currentQuestion) {
          // Duplicate notification for whatever reason, ignare.
          return;
        }

        // Otherwise, yield the next question.
        controller.add(
          LiveQuestion(
            question:
                message.game.quiz!.questions[message.game.currentQuestion],
            index: message.game.currentQuestion,
            startedAt: message.game.questionStart,
            deadline: message.game.deadline,
          ),
        );
      }

      if (message.type == GameEventType.end) {
        controller.close();
        session.messages.removeListener(Topics.game(gameId), onGameEvent);
      }
    }

    session.messages.addListener(
      Topics.game(gameId),
      onGameEvent,
    );
    yield* controller.stream;
  }

  Future<GameResult> getResults(Session session, int gameId) async {
    final game = await Game.db.findById(
      session,
      gameId,
      include: Game.include(players: Player.includeList()),
    );
    if (game == null) {
      throw Exception('Game not found');
    }

    return GameResult(
      scores: game.players!,
    );
  }
}
