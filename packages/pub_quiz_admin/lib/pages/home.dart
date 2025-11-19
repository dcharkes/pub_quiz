import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../components/quiz_list.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return div([
      h1(classes: 'page-header', [text('Pub Quiz Admin')]),
      div([
        button(
          onClick: () {
            Router.of(context).push('/edit');
          },
          classes: 'add-quiz-button',
          [
            i(classes: 'material-icons md-18', [text('add')]),
            text('Add New Quiz'),
          ],
        ),
      ]),
      const QuizList(),
    ]);
  }
}
