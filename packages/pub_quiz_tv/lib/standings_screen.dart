import 'package:flutter/material.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

import 'client_provider.dart';

class StandingsScreen extends StatefulWidget {
  final int pin;

  const StandingsScreen({required this.pin, super.key});

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  late final Future<Game> gameFuture;

  @override
  void initState() {
    gameFuture = ClientProvider.of(
      context,
    ).player.getGame(widget.pin);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: gameFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          final players = snapshot.data!.players!
            ..sort(
              (a, b) => b.score.compareTo(a.score),
            );
          return ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Text('#$index'),
                title: Text(players[index].name),
                leading: Text(players[index].score.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
