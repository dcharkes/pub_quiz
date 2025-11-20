import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:async/async.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

final parser = ArgParser()
  ..addOption('quiz_id', help: 'Quiz to start the game for')
  ..addOption('server', help: 'Server address');

Future<void> main(List<String> args) async {
  final argResults = parser.parse(args);
  final quizId = int.tryParse(argResults.option('quiz_id') ?? '');
  final server = argResults.option('server');
  print('server: $server');
  if (quizId == null || server == null) {
    print('dart run bin/fake_tv.dart --server=SERVER --quiz_id=QUIZ_ID');
    print(parser.usage);
    return;
  }

  final client = Client(server);
  final quiz = await client.quiz.readQuiz(quizId);
  print('Got quiz ${quiz!.title} with id $quizId');
  final gameId = await client.game.startGame(quizId);
  final game = await client.player.getGame(gameId);
  print('Started the game ${game.quiz!.title} with id $gameId');

  final enters = StreamQueue(
    stdin.transform(utf8.decoder).transform(const LineSplitter()),
  );
  final subscription = client.game.getGameEvents(gameId).listen((event) {
    switch (event.type) {
      case GameEventType.player_joined:
        print('Player joined: ${event.player!.name}');
        break;
      case GameEventType.question:
        final question =
            game.quiz!.questions[event.game.currentQuestion].question;
        print('Question started: $question');
        break;
      case GameEventType.player_answered:
        print(
          'Player ${event.player!.name} answered, '
          'score: ${event.player!.score}',
        );
        break;
      case GameEventType.end:
        print('Game over');
        break;
      default:
        break;
    }
  });

  var questionIndex = 0;

  while (questionIndex < game.quiz!.questions.length) {
    print('Press ENTER for the next question');
    await enters.next;
    await client.game.setQuestion(
      gameId,
      questionIndex,
      const Duration(seconds: 10),
    );
    questionIndex++;
  }

  await client.game.finishGame(gameId);
  await subscription.cancel();
  client.close();
}
