import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:pub_quiz_shared/urls.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'client_provider.dart';

class StartScreen extends StatefulWidget {
  final int pin;

  const StartScreen({super.key, required this.pin});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<Player> _players = [];
  StreamSubscription<Player>? _subscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _subscription = ClientProvider.of(
      context,
    ).game.getPlayers(widget.pin).listen(_handlePlayerJoined);
  }

  void _handlePlayerJoined(Player player) {
    setState(() {
      _players.add(player);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            Row(
              mainAxisAlignment: .center,
              children: [
                Column(
                  children: [
                    Text(
                      'Game PIN:',
                      style: textTheme.displaySmall,
                    ),
                    Text(
                      '${widget.pin}',
                      style: textTheme.displayLarge,
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth / 10,
                ),
                QrImageView(
                  size: screenWidth / 10,
                  data: '$playerUrl/game/${widget.pin}/',
                  version: QrVersions.auto,
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Waiting for players...',
              style: textTheme.displayLarge,
            ),
            const Spacer(),
            Wrap(
              children: [
                for (final player in _players)
                  Text(
                    player.name,
                    style: textTheme.displayLarge,
                  ),
              ],
            ),
            const Spacer(),
            FilledButton(
              onPressed: () {
                context.go('/game/${widget.pin}/questions');
              },
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
