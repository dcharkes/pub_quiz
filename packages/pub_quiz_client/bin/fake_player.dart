import 'dart:io';
import 'package:args/args.dart';
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
  final gameId = int.tryParse(argResults.option('game_id')!);
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

  final playerId = await client.player.joinGame(gameId, name);
  print('Joined the game with ID $playerId');
}
