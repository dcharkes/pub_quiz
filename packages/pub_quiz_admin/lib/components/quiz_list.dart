import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'package:pub_quiz_client/pub_quiz_client.dart';

class QuizList extends StatelessComponent {
  const QuizList({super.key, required this.quizzes});

  final List<Quiz> quizzes;

  @override
  Component build(BuildContext context) {
    return ul(
      classes: 'quiz-list',
      quizzes
          .map(
            (quiz) => li(
              classes: 'quiz-list-item',
              [
                span([text(quiz.title)]),
                button(
                  onClick: () {
                    Router.of(context).push('/edit/${quiz.id}');
                  },
                  [
                    i(classes: 'material-icons md-18', [text('edit')]),
                    text('Edit'),
                  ],
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
