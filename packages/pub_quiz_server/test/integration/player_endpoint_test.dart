import 'dart:async';

import 'package:pub_quiz_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

const oneMinute = Duration(minutes: 1);
void main() {
  withServerpod('e2e', rollbackDatabase: .disabled, (
    sessionBuilder,
    endpoints,
  ) {
    var quizId = -1;

    setUp(() async {
      quizId = (await endpoints.quiz.createQuiz(
        sessionBuilder,
        fakeQuiz,
      )).id!;
    });

    Future<int> startGame() async {
      return endpoints.game.startGame(sessionBuilder, quizId);
    }

    Future<void> setQuestion(int gameId, int index) =>
        endpoints.game.setQuestion(sessionBuilder, gameId, index, oneMinute);
    

    test('can start games', () async {
      expect(await startGame(), isNotNull);
    });

    test('player can join games', () async {
      expect(
        await endpoints.player.joinGame(
        sessionBuilder,
          await startGame(),
        'Hodor',
        ),
        isNotNull,
      );
    });

    test('joined player gets the current question', () async {
      final gameId = await startGame();
      await setQuestion(gameId, 5);
      await endpoints.player.joinGame(
        sessionBuilder,
        gameId,
        'Hodor',
      );
      final question = await endpoints.player
          .getQuestions(sessionBuilder, gameId)
          .first;
      expect(question.index, 5);
    });

    test('joined player gets the question once the game sets it', () async {
      final gameId = await startGame();
      await endpoints.player.joinGame(sessionBuilder, gameId, 'Hodor');
      final questionFuture = endpoints.player
          .getQuestions(sessionBuilder, gameId)
          .first;
      // Expect that there's no question as the game hasn't started.
      await expectLater(
        questionFuture.timeout(const Duration(microseconds: 1)),
        throwsA(isA<TimeoutException>()),
      );
      await endpoints.game.setQuestion(
        sessionBuilder,
        gameId,
        0,
        oneMinute
      );
      final question = await questionFuture;
      expect(question.index, 0);
    });
    test('player gets all questions', () async {
      final gameId = await startGame();
      await endpoints.player.joinGame(sessionBuilder, gameId, 'Hodor');
      var ack = Completer<LiveQuestion>();
      final questionsSubscription = endpoints.player
          .getQuestions(sessionBuilder, gameId)
          .listen((q) {
            ack.complete(q);
          });
      await setQuestion(gameId, 0);
      expect((await ack.future).index, 0);
      ack = Completer<LiveQuestion>();
      await setQuestion(gameId, 1);
      expect((await ack.future).index, 1);
      await questionsSubscription.cancel();
    });
  });
}

final fakeQuiz = Quiz(
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
