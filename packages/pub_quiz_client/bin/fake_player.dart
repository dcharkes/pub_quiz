import 'dart:io';
import 'dart:math';
import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

final parser = ArgParser()
  ..addOption('game_id', help: 'Game ID to join to')
  ..addOption('server', help: 'Server address')
  ..addOption(
    'name',
    help: 'Player name',
    defaultsTo: Platform.environment['USER'] ?? 'Player',
  );

void main(List<String> args) async {
  final argResults = parser.parse(args);
  final gameId = int.tryParse(argResults.option('game_id') ?? '');
  final server = argResults.option('server');
  final name = argResults.option('name')!;
  if (gameId == null || server == null) {
    print(
      'dart run bin/fake_player.dart --server=SERVER --game_id=GAME_ID',
    );
    print(parser.usage);
    return;
  }
  final client = Client(server);
  final game = await client.player.getGame(gameId);
  final playerId = await client.player.joinGame(gameId, name);
  print('Joined the game ${game.quiz!.title} with ID $playerId');

  final random = Random();
  await for (final question in client.player.getQuestions(gameId)) {
    print(question.question.question);
    for (final answer in question.question.answers) {
      print('- ${answer.text}');
    }
    await Future<void>.delayed(const Duration(seconds: 5));
    final answerIndex = random.nextInt(question.question.answers.length);
    
    final score = await client.player.recordAnswer(
      playerId,
      question.index,
      answerIndex,
      DateTime.now(),
    );
    print(
      'Answered ${question.question.answers[answerIndex].text},'
      ' got $score points',
    );
  }

  final results = await client.player.getResults(gameId);
  final leaderboard = results.scores.sorted(
    (a, b) => b.score.compareTo(a.score),
  );
  print('Leaderboard');
  for (final p in leaderboard) {
    print('${p.name}: ${p.score}');
  }
}
