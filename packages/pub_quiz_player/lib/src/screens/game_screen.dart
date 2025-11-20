import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:pub_quiz_widgets/pub_quiz_widgets.dart';
import '../services/fake_player_client.dart';
import 'game_over_screen.dart';
import 'question_screen.dart';

class GameScreen extends StatefulWidget {
  final PlayerClient client;

  const GameScreen({
    super.key,
    required this.client,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  StreamSubscription<LiveQuestion>? _subscription;
  LiveQuestion? _currentQuestion;
  Timer? _timer;
  int _timeLeft = 0;
  bool _hasAnswered = false;
  bool _isGameOver = false;

  @override
  void initState() {
    super.initState();
    _subscription = widget.client.questionsStream.listen(
      _onQuestion,
      onDone: _onDone,
    );
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  void _onQuestion(LiveQuestion question) {
    setState(() {
      _currentQuestion = question;
      _hasAnswered = false;
      _timeLeft = question.deadline.difference(DateTime.now()).inSeconds;
      if (_timeLeft < 0) _timeLeft = 0;
    });
    _startTimer();
  }

  void _onDone() {
    setState(() {
      _isGameOver = true;
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        final now = DateTime.now();
        if (_currentQuestion != null) {
          _timeLeft = _currentQuestion!.deadline.difference(now).inSeconds;
        }
        if (_timeLeft <= 0) {
          _timeLeft = 0;
          timer.cancel();
        }
      });
    });
  }

  Future<void> _submitAnswer(int answerId) async {
    if (_hasAnswered || _timeLeft <= 0 || _currentQuestion == null) return;

    setState(() {
      _hasAnswered = true;
    });

    await widget.client.recordAnswer(_currentQuestion!.index, answerId);
  }

  @override
  Widget build(BuildContext context) {
    if (_isGameOver) {
      return FutureBuilder<GameResults>(
        future: widget.client.getResults(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GameOverScreen(results: snapshot.data!);
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      );
    }

    if (_currentQuestion == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.client.quizDescription.title)),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PubQuizLogo(),
              SizedBox(height: 32),
              Text('The game will start soon...'),
            ],
          ),
        ),
      );
    }

    if (_hasAnswered || _timeLeft <= 0) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.client.quizDescription.title)),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PubQuizLogo(),
              SizedBox(height: 32),
              Text('Waiting for the next question...'),
            ],
          ),
        ),
      );
    }

    return QuestionScreen(
      question: _currentQuestion!,
      quizTitle: widget.client.quizDescription.title,
      timeLeft: _timeLeft,
      onAnswerSelected: _submitAnswer,
    );
  }
}
