import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart' as flame;
import 'package:flame/particles.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:rive/rive.dart' as rive;

import 'client_provider.dart';

class FinalScreen extends StatefulWidget {
  final int pin;

  const FinalScreen({required this.pin, super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  late final Future<Game> gameFuture;

  @override
  void didChangeDependencies() {
    gameFuture = ClientProvider.of(
      context,
    ).player.getGame(widget.pin);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context).shortestSide;
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
          return Stack(
            children: [
              Center(
                child: flame.GameWidget(game: _PodiumGame(screenSize, context)),
              ),
              _buildPodium(players),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPodium(List<Player> players) {
    final top3 = players.take(3).toList();
    final others = players.skip(3).toList();

    return Column(
      children: [
        const SizedBox(height: 50),
        const Text(
          'Game Over',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (top3.length > 1) _buildPodiumEntry(top3[1], 2, 200),
            if (top3.isNotEmpty) _buildPodiumEntry(top3[0], 1, 300),
            if (top3.length > 2) _buildPodiumEntry(top3[2], 3, 150),
          ],
        ),
        const SizedBox(height: 50),
        Expanded(
          child: ListView.builder(
            itemCount: others.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(
                  '#${index + 4}',
                  style: const TextStyle(color: Colors.white),
                ),
                title: Text(
                  others[index].name,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Text(
                  others[index].score.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPodiumEntry(Player player, int rank, double height) {
    const podiumColors = {
      1: Color(0xFFFFD700),
      2: Color(0xFFC0C0C0),
      3: Color(0xFFCD7F32),
    };

    return Container(
      width: 150,
      height: height,
      decoration: BoxDecoration(
        color: podiumColors[rank],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '#$rank',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            player.name,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            player.score.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class _PodiumGame extends flame.FlameGame {
  final double confettiSize;
  final BuildContext context;

  _PodiumGame(this.confettiSize, this.context);

  @override
  Future<void> onLoad() async {
    final artboard = await loadArtboard(
      rive.RiveFile.asset('assets/confetti.riv'),
    );
    final controller = StateMachineController.fromArtboard(
      artboard,
      'State Machine 1',
    );
    artboard.addController(controller!);
    final riveComponent =
        RiveComponent(
            artboard: artboard,
            size: Vector2.all(confettiSize),
          )
          ..anchor = Anchor.center
          ..position = size / 2;
    add(riveComponent);

    add(
      ParticleSystemComponent(
        particle: Particle.generate(
          count: 20,
          lifespan: 2,
          generator: (i) => AcceleratedParticle(
            acceleration: Vector2(0, 100),
            speed: Vector2(Random().nextDouble() * -200, 0),
            position: Vector2(
              Random().nextDouble() * size.x,
              size.y,
            ),
            child: CircleParticle(
              radius: 2,
              paint: Paint()..color = Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
