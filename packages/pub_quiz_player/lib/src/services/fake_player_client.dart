import 'dart:async';
import 'package:pub_quiz_client/pub_quiz_client.dart';

Stream<void> nowAndLater(Duration duration) async* {
  yield null;
  yield* Stream<void>.periodic(duration);
}

Future<PlayerClient> connectFakeClient(String gameId) async {
  return FakeClient(
    fakeQuiz,
    nowAndLater(const Duration(seconds: 10)),
    interval: const Duration(seconds: 9),
  );
}

abstract interface class PlayerClient {
  QuizDescription get quizDescription;
  Stream<PlayerQuestion> get questionsStream;
  Future<GameResults> getResults();

  Future<void> recordAnswer(int questionId, int answerId);

  Future<void> join(String name);

  void dispose();
}

class GameResults {
  final int correctAnswers;
  final int totalAnswers;

  GameResults({
    required this.correctAnswers,
    required this.totalAnswers,
  });
}

class PlayerQuestion {
  final Question question;
  final int index;
  final DateTime timeout;
  final List<PlayerAnswer> answers;

  PlayerQuestion({
    required this.question,
    required this.timeout,
    required this.index,
  }) : answers = question.answers.indexed
           .map<PlayerAnswer>(
             (e) => PlayerAnswer(
               answer: e.$2,
               questionId: index,
               answerId: e.$1,
             ),
           )
           .toList();
}

class PlayerAnswer {
  final Answer answer;
  final int questionId;
  final int answerId;

  PlayerAnswer({
    required this.answer,
    required this.questionId,
    required this.answerId,
  });
}

/// Player-relevant projection of a quiz.
class QuizDescription {
  final String title;

  QuizDescription({required this.title});

  static QuizDescription fromQuiz(Quiz quiz) {
    return QuizDescription(title: quiz.title);
  }
}

class FakeClient implements PlayerClient {
  late final StreamSubscription<void> _clicksSubscription;
  @override
  final QuizDescription quizDescription;
  final Duration _interval;

  /// The game has not started.
  var _currentQuestion = -1;
  final List<Question> questions;
  final _questionController = StreamController<PlayerQuestion>();

  @override
  Stream<PlayerQuestion> get questionsStream => _questionController.stream;

  FakeClient(
    Quiz quiz,
    Stream<void> clicks, {
    Duration interval = const Duration(seconds: 30),
  }) : quizDescription = QuizDescription.fromQuiz(quiz),
       questions = quiz.questions,
       _interval = interval {
    _clicksSubscription = clicks.listen((_) => _onClick());
  }

  void _onClick() {
    _currentQuestion++;
    if (_currentQuestion >= questions.length) {
      _clicksSubscription.cancel();
      _questionController.close();
      return;
    }
    _questionController.add(
      PlayerQuestion(
        question: questions[_currentQuestion],
        timeout: DateTime.now().add(_interval),
        index: _currentQuestion,
      ),
    );
  }

  int _correctAnswers = 0;
  int _totalAnswers = 0;

  @override
  Future<void> recordAnswer(int questionId, int answerId) async {
    _totalAnswers++;
    if (questions[questionId].answers[answerId].correct) {
      _correctAnswers++;
    }
  }

  @override
  Future<GameResults> getResults() async {
    return GameResults(
      correctAnswers: _correctAnswers,
      totalAnswers: _totalAnswers,
    );
  }

  @override
  Future<void> join(String name) async {}

  @override
  void dispose() {
    _clicksSubscription.cancel();
    _questionController.close();
  }
}

final fakeQuiz = Quiz(
  id: 1,
  title: 'Dart & Flutter Fundamentals',
  questions: [
    Question(
      question: 'What is Dart primarily used for?',
      answers: [
        Answer(
          text: 'Web development',
          correct: false,
        ),
        Answer(
          text: 'Mobile app development (Flutter)',
          correct: true,
        ),
        Answer(
          text: 'Backend services',
          correct: false,
        ),
        Answer(text: 'Data analysis', correct: false),
      ],
    ),
    Question(
      question: 'Which of these is NOT a type of widget in Flutter?',
      answers: [
        Answer(
          text: 'StatelessWidget',
          correct: false,
        ),
        Answer(
          text: 'StatefulWidget',
          correct: false,
        ),
        Answer(
          text: 'FunctionalWidget',
          correct: true,
        ),
        Answer(
          text: 'InheritedWidget',
          correct: false,
        ),
      ],
    ),
    Question(
      question: 'What keyword is used to define a nullable type in Dart?',
      answers: [
        Answer(text: 'nullable', correct: false),
        Answer(text: '?', correct: true),
        Answer(text: '!', correct: false),
        Answer(text: 'void', correct: false),
      ],
    ),
    Question(
      question: 'How do you arrange widgets vertically in Flutter?',
      answers: [
        Answer(text: 'Row', correct: false),
        Answer(text: 'Stack', correct: false),
        Answer(text: 'Column', correct: true),
        Answer(text: 'Wrap', correct: false),
      ],
    ),
    Question(
      question:
          'Which keyword is used to mark a function as asynchronous in Dart?',
      answers: [
        Answer(text: 'sync', correct: false),
        Answer(text: 'await', correct: false),
        Answer(text: 'async', correct: true),
        Answer(text: 'future', correct: false),
      ],
    ),
    Question(
      question: 'What is the package manager for Dart?',
      answers: [
        Answer(text: 'npm', correct: false),
        Answer(text: 'pub', correct: true),
        Answer(text: 'yarn', correct: false),
        Answer(text: 'pip', correct: false),
      ],
    ),
    Question(
      question: 'What does Flutter\'s "Hot Reload" feature do?',
      answers: [
        Answer(
          text: 'Restarts the entire application',
          correct: false,
        ),
        Answer(
          text: 'Recompiles the entire application from scratch',
          correct: false,
        ),
        Answer(
          text: 'Injects updated source code into the running app',
          correct: true,
        ),
        Answer(
          text: 'Deploys the app to a remote server',
          correct: false,
        ),
      ],
    ),
    Question(
      question:
          'Which of these is a common state management solution in Flutter?',
      answers: [
        Answer(text: 'Redux', correct: false),
        Answer(text: 'BLoC (Business Logic Component)', correct: true),
        Answer(text: 'AngularJS', correct: false),
        Answer(text: 'React Hooks', correct: false),
      ],
    ),
    Question(
      question: 'What command is used to create a new Flutter project?',
      answers: [
        Answer(text: 'flutter new app', correct: false),
        Answer(text: 'flutter create', correct: true),
        Answer(text: 'dart create flutter_app', correct: false),
        Answer(text: 'flutter init', correct: false),
      ],
    ),
    Question(
      question: 'In Dart, what is the purpose of the `final` keyword?',
      answers: [
        Answer(
          text: 'To make a variable immutable at compile-time',
          correct: false,
        ),
        Answer(
          text: 'To make a variable immutable after its first assignment',
          correct: true,
        ),
        Answer(
          text: 'To declare a constant value',
          correct: false,
        ),
        Answer(
          text: 'To define a static variable',
          correct: false,
        ),
      ],
    ),
  ],
);
