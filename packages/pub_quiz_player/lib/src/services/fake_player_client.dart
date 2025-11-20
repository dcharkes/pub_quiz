import 'dart:async';
import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:pub_quiz_shared/urls.dart';

Stream<void> nowAndLater(Duration duration) async* {
  yield null;
  yield* Stream<void>.periodic(duration);
}

Future<PlayerClient> connectFakeClient(String gameId) async {
  final endpoint = FakeEndpointPlayer(
    fakeQuiz,
    nowAndLater(const Duration(seconds: 10)),
    interval: const Duration(seconds: 9),
  );
  return PlayerClient(
    endpoint,
    1, // fake gameId
    quizDescription: QuizDescription.fromQuiz(fakeQuiz),
    totalQuestions: fakeQuiz.questions.length,
  );
}

Future<PlayerClient> connectRealClient(int gameId) async {
  final client = Client(serverUrl);
  return PlayerClient(
    client.player,
    gameId,
    quizDescription: QuizDescription(title: 'My Quiz'), // TODO
    totalQuestions: 10, // TODO
  );
}

class PlayerClient {
  final EndpointPlayer _endpoint;
  final int _gameId;
  final QuizDescription quizDescription;
  final int totalQuestions;
  int? _playerId;

  PlayerClient(
    this._endpoint,
    this._gameId, {
    required this.quizDescription,
    required this.totalQuestions,
  });

  Stream<LiveQuestion> get questionsStream {
    return _endpoint.getQuestions(_gameId);
  }

  Future<void> join(String name) async {
    _playerId = await _endpoint.joinGame(_gameId, name);
  }

  Future<void> recordAnswer(int questionId, int answerId) async {
    if (_playerId == null) return;
    await _endpoint.recordAnswer(
      _playerId!,
      questionId,
      answerId,
      DateTime.now(),
    );
  }

  Future<GameResults> getResults() async {
    final result = await _endpoint.getResults(_gameId);
    final player = result.scores.firstWhere(
      (p) => p.id == _playerId,
      orElse: () => Player(
        gameId: _gameId,
        name: '',
        score: 0,
      ),
    );
    return GameResults(
      correctAnswers: player.score,
      totalAnswers: totalQuestions,
    );
  }

  void dispose() {
    if (_endpoint is FakeEndpointPlayer) {
      _endpoint.dispose();
    }
  }
}

class GameResults {
  final int correctAnswers;
  final int totalAnswers;

  GameResults({
    required this.correctAnswers,
    required this.totalAnswers,
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

class FakeEndpointPlayer implements EndpointPlayer {
  late final StreamSubscription<void> _clicksSubscription;
  final Duration _interval;
  final Quiz _quiz;

  /// The game has not started.
  var _currentQuestion = -1;
  final _questionController = StreamController<LiveQuestion>();

  FakeEndpointPlayer(
    this._quiz,
    Stream<void> clicks, {
    Duration interval = const Duration(seconds: 30),
  }) : _interval = interval {
    _clicksSubscription = clicks.listen((_) => _onClick());
  }

  void _onClick() {
    _currentQuestion++;
    if (_currentQuestion >= _quiz.questions.length) {
      _clicksSubscription.cancel();
      _questionController.close();
      return;
    }
    _questionController.add(
      LiveQuestion(
        question: _quiz.questions[_currentQuestion],
        index: _currentQuestion,
        startedAt: DateTime.now(),
        deadline: DateTime.now().add(_interval),
      ),
    );
  }

  int _correctAnswers = 0;

  @override
  Future<int> joinGame(int gameId, String name) async {
    return 123; // Fake player ID
  }

  @override
  Future<int> recordAnswer(
    int playerId,
    int questionIndex,
    int answerIndex,
    DateTime answerTime,
  ) async {
    if (_quiz.questions[questionIndex].answers[answerIndex].correct) {
      _correctAnswers++;
    }
    return _correctAnswers;
  }

  @override
  Stream<LiveQuestion> getQuestions(int gameId) => _questionController.stream;

  @override
  Future<GameResult> getResults(int gameId) async {
    return GameResult(
      scores: [
        Player(
          id: 123,
          gameId: gameId,
          name: 'Player',
          score: _correctAnswers,
        ),
      ],
    );
  }

  @override
  EndpointCaller get caller => throw UnimplementedError();

  @override
  String get name => 'player';

  @override
  ServerpodClientShared get client => throw UnimplementedError();

  @override
  set client(ServerpodClientShared value) {}

  @override
  Stream<SerializableModel> get stream => throw UnimplementedError();

  @override
  void resetStream() {}

  @override
  Future<void> sendStreamMessage(SerializableModel message) async {}

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
