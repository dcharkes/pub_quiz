import 'dart:async';
import 'package:pub_quiz_client/pub_quiz_client.dart';

Future<PlayerClient> connectFakeClient(String gameId) async {
  return FakeClient(
    fakeQuiz,
    Stream<void>.periodic(const Duration(seconds: 10)),
    interval: const Duration(seconds: 8),
  );
}

abstract interface class PlayerClient {
  QuizDescription get quizDescription;
  Stream<PlayerQuestion> get questionsStream;

  Future<void> recordAnswer(int questionId, int answerId);

  Future<void> join(String name);

  void dispose();
}

class PlayerQuestion {
  final Question question;
  final DateTime timeout;

  PlayerQuestion({required this.question, required this.timeout});
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
       questions = quiz.questions!,
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
      ),
    );
  }

  @override
  Future<void> recordAnswer(int questionId, int answerId) async {}

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
      id: 1,
      quizId: 1,
      question: 'What is Dart primarily used for?',
      answers: [
        Answer(
          id: 11,
          questionId: 1,
          text: 'Web development',
          correct: false,
        ),
        Answer(
          id: 12,
          questionId: 1,
          text: 'Mobile app development (Flutter)',
          correct: true,
        ),
        Answer(
          id: 13,
          questionId: 1,
          text: 'Backend services',
          correct: false,
        ),
        Answer(id: 14, questionId: 1, text: 'Data analysis', correct: false),
      ],
    ),
    Question(
      id: 2,
      quizId: 1,
      question: 'Which of these is NOT a type of widget in Flutter?',
      answers: [
        Answer(
          id: 21,
          questionId: 2,
          text: 'StatelessWidget',
          correct: false,
        ),
        Answer(
          id: 22,
          questionId: 2,
          text: 'StatefulWidget',
          correct: false,
        ),
        Answer(
          id: 23,
          questionId: 2,
          text: 'FunctionalWidget',
          correct: true,
        ),
        Answer(
          id: 24,
          questionId: 2,
          text: 'InheritedWidget',
          correct: false,
        ),
      ],
    ),
    Question(
      id: 3,
      quizId: 1,
      question: 'What keyword is used to define a nullable type in Dart?',
      answers: [
        Answer(id: 31, questionId: 3, text: 'nullable', correct: false),
        Answer(id: 32, questionId: 3, text: '?', correct: true),
        Answer(id: 33, questionId: 3, text: '!', correct: false),
        Answer(id: 34, questionId: 3, text: 'void', correct: false),
      ],
    ),
    Question(
      id: 4,
      quizId: 1,
      question: 'How do you arrange widgets vertically in Flutter?',
      answers: [
        Answer(id: 41, questionId: 4, text: 'Row', correct: false),
        Answer(id: 42, questionId: 4, text: 'Stack', correct: false),
        Answer(id: 43, questionId: 4, text: 'Column', correct: true),
        Answer(id: 44, questionId: 4, text: 'Wrap', correct: false),
      ],
    ),
    Question(
      id: 5,
      quizId: 1,
      question:
          'Which keyword is used to mark a function as asynchronous in Dart?',
      answers: [
        Answer(id: 51, questionId: 5, text: 'sync', correct: false),
        Answer(id: 52, questionId: 5, text: 'await', correct: false),
        Answer(id: 53, questionId: 5, text: 'async', correct: true),
        Answer(id: 54, questionId: 5, text: 'future', correct: false),
      ],
    ),
    Question(
      id: 6,
      quizId: 1,
      question: 'What is the package manager for Dart?',
      answers: [
        Answer(id: 61, questionId: 6, text: 'npm', correct: false),
        Answer(id: 62, questionId: 6, text: 'pub', correct: true),
        Answer(id: 63, questionId: 6, text: 'yarn', correct: false),
        Answer(id: 64, questionId: 6, text: 'pip', correct: false),
      ],
    ),
    Question(
      id: 7,
      quizId: 1,
      question: 'What does Flutter\'s "Hot Reload" feature do?',
      answers: [
        Answer(
          id: 71,
          questionId: 7,
          text: 'Restarts the entire application',
          correct: false,
        ),
        Answer(
          id: 72,
          questionId: 7,
          text: 'Recompiles the entire application from scratch',
          correct: false,
        ),
        Answer(
          id: 73,
          questionId: 7,
          text: 'Injects updated source code into the running app',
          correct: true,
        ),
        Answer(
          id: 74,
          questionId: 7,
          text: 'Deploys the app to a remote server',
          correct: false,
        ),
      ],
    ),
    Question(
      id: 8,
      quizId: 1,
      question:
          'Which of these is a common state management solution in Flutter?',
      answers: [
        Answer(id: 81, questionId: 8, text: 'Redux', correct: false),
        Answer(
          id: 82,
          questionId: 8,
          text: 'BLoC (Business Logic Component)',
          correct: true,
        ),
        Answer(id: 83, questionId: 8, text: 'AngularJS', correct: false),
        Answer(id: 84, questionId: 8, text: 'React Hooks', correct: false),
      ],
    ),
    Question(
      id: 9,
      quizId: 1,
      question: 'What command is used to create a new Flutter project?',
      answers: [
        Answer(
          id: 91,
          questionId: 9,
          text: 'flutter new app',
          correct: false,
        ),
        Answer(id: 92, questionId: 9, text: 'flutter create', correct: true),
        Answer(
          id: 93,
          questionId: 9,
          text: 'dart create flutter_app',
          correct: false,
        ),
        Answer(id: 94, questionId: 9, text: 'flutter init', correct: false),
      ],
    ),
    Question(
      id: 10,
      quizId: 1,
      question: 'In Dart, what is the purpose of the `final` keyword?',
      answers: [
        Answer(
          id: 101,
          questionId: 10,
          text: 'To make a variable immutable at compile-time',
          correct: false,
        ),
        Answer(
          id: 102,
          questionId: 10,
          text: 'To make a variable immutable after its first assignment',
          correct: true,
        ),
        Answer(
          id: 103,
          questionId: 10,
          text: 'To declare a constant value',
          correct: false,
        ),
        Answer(
          id: 104,
          questionId: 10,
          text: 'To define a static variable',
          correct: false,
        ),
      ],
    ),
  ],
);
