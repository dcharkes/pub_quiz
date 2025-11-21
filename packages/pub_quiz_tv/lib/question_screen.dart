import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

import 'client_provider.dart';
import 'standings_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.pin,
  });

  final int pin;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestion = 0;
  final maxTime = 30;
  int timeLeft = 0;
  Game? _game;
  bool _showAnswer = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadGame();
  }

  void _loadGame() async {
    final game = await ClientProvider.of(
      context,
    ).player.getGame(widget.pin);
    setState(() {
      _game = game;
    });
    _loadQuestion(0);
  }

  Timer? _timer;

  void _loadQuestion(int questionId) async {
    unawaited(
      ClientProvider.of(
        context,
      ).game.setQuestion(widget.pin, questionId, Duration(seconds: maxTime)),
    );
    setState(() {
      _showAnswer = false;
      currentQuestion = questionId;
      timeLeft = maxTime;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        timeLeft = timeLeft - 1;
      });
      if (timeLeft == 0) {
        _timer?.cancel();
        setState(() {
          _showAnswer = true;
        });
      }
    });
  }

  void _handleNext() {
    if (currentQuestion < _game!.quiz!.questions.length - 1) {
      _loadQuestion(currentQuestion + 1);
    } else {
      ClientProvider.of(context).game.finishGame(_game!.id!);
      context.go('/game/${_game!.id!}/over');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _game != null
        ? QuestionWidget(
            question: _game!.quiz!.questions[currentQuestion],
            quizTitle: _game!.quiz!.title,
            timeLeft: timeLeft,
            showAnswer: _showAnswer,
            maxTime: maxTime,
            gameId: _game!.id!,
            onNext: _handleNext,
          )
        : const SizedBox();
  }
}

class QuestionWidget extends StatelessWidget {
  final Question question;
  final String quizTitle;
  final int timeLeft;
  final int maxTime;
  final bool showAnswer;
  final int gameId;
  final VoidCallback onNext;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.quizTitle,
    required this.timeLeft,
    required this.showAnswer,
    required this.gameId,
    required this.maxTime,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final answers = question.answers;

    return Scaffold(
      appBar: AppBar(title: Text(quizTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Timer
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: timeLeft / maxTime,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '$timeLeft s',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              if (showAnswer) ...[
                Standings(
                  pin: gameId,
                ),
                FilledButton(onPressed: onNext, child: const Text('Next')),
              ],
              // Question Card
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          question.question,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Answers List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: answers.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final answer = answers[index];
                  return SizedBox(
                    height: 64, // Fixed height for better touch targets
                    child: FilledButton(
                      onPressed: () => {},
                      style: FilledButton.styleFrom(
                        backgroundColor: showAnswer
                            ? (answer.correct ? Colors.green : Colors.red)
                            : null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(answer.text),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
