import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/header.dart';
import 'pages/editor.dart';
import 'pages/home.dart';

// The main component of your application.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    // This method is rerun every time the component is rebuilt.

    // Renders a <div class="main"> html element with children.
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
                path: '/editor',
                title: 'Quiz Editor',
                builder: (context, state) => const QuizEditor(),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
