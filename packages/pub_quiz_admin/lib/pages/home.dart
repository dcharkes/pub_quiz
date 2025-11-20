import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../components/quiz_list.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'container', [
      header(
        classes: 'page-header',
        [
          h1([text('Pub Quiz Admin')]),
          div(classes: 'grid', [
            button(
              onClick: () {
                Router.of(context).push('/generate');
              },
              [
                i(classes: 'material-icons md-18', [text('auto_awesome')]),
                text('Generate Quiz with AI'),
              ],
            ),
            button(
              onClick: () {
                Router.of(context).push('/edit');
              },
              [
                i(classes: 'material-icons md-18', [text('add')]),
                text('Manually Create a Quiz'),
              ],
            ),
          ]),
        ],
      ),
      const QuizList(),
    ]);
  }
}
