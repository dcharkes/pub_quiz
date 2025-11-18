import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

import 'components/header.dart';
import 'pages/editor.dart';
import 'pages/home.dart';

final quizzes = {
  123: Quiz(
    title: 'Quiz 1',
    questions: [
      Question(
        question: 'Question 1',
        answers: [
          Answer(text: 'Answer 1', correct: true),
          Answer(text: 'Answer 2', correct: true),
          Answer(text: 'Answer 3', correct: true),
          Answer(text: 'Answer 4', correct: true),
        ],
      ),
    ],
  )..id = 123,
  456: Quiz(
    title: 'Quiz 2',
    questions: [
      Question(
        question: 'Question 1',
        answers: [
          Answer(text: 'Answer 1', correct: true),
          Answer(text: 'Answer 2', correct: true),
          Answer(text: 'Answer 3', correct: true),
          Answer(text: 'Answer 4', correct: true),
        ],
      ),
    ],
  )..id = 456,
};

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'main', [
      Router(
        routes: [
          ShellRoute(
            builder: (context, state, child) => fragment([
              const Header(),
              child,
            ]),
            routes: [
              Route(
                path: '/',
                title: 'Home',
                builder: (context, state) => const Home(),
              ),
              Route(
                path: '/edit',
                title: 'Quiz Editor',
                builder: (context, state) => const QuizEditor(),
              ),
              Route(
                path: '/edit/:quizId',
                title: 'Quiz Editor',
                builder: (context, state) {
                  final quiz = quizzes[int.parse(state.params['quizId']!)];
                  return QuizEditor(quiz: quiz);
                },
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
