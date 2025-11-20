import 'package:flutter/material.dart';

import 'standings_screen.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key, required this.gameId});

  final int gameId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Game Over',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Standings(pin: gameId),
        ],
      ),
    );
  }
}
