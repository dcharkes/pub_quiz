import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'pages/editor.dart';
import 'pages/generate_quiz_page.dart';
import 'pages/home.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'main', [
      Router(
        routes: [
          ShellRoute(
            builder: (context, state, child) => fragment([
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
                  final quizId = int.parse(state.params['quizId']!);
                  return QuizEditor(quizId: quizId);
                },
              ),
              Route(
                path: '/generate',
                title: 'Generate Quiz',
                builder: (context, state) => const GenerateQuizPage(),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
