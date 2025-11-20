import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../components/quiz_list.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'container', [
      header(classes: 'page-header', [
        h1([text('Pub Quiz Admin')]),
        button(
          onClick: () {
            Router.of(context).push('/edit');
          },
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
