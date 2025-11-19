import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'package:pub_quiz_client/pub_quiz_client.dart';

import 'db.dart';

class QuizList extends StatefulComponent {
  const QuizList({super.key});

  @override
  State createState() => QuizListState();
}

class QuizListState extends State<QuizList> {
  List<Quiz> quizzes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DbProvider.of(context).quiz.readQuizzes().then((q) {
      if (!mounted) {
        return;
      }
      setState(() {
        quizzes = q;
      });
    });
  }

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
