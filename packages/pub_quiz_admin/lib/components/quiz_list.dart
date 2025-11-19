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
  List<Quiz> _quizzes = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadQuizzes();
  }

  void _loadQuizzes() async {
    final quizzes = await DbProvider.of(context).quiz.readQuizzes();
    if (!mounted) {
      return;
    }
    setState(() {
      _quizzes = quizzes;
    });
  }

  @override
  Component build(BuildContext context) {
    return ul(
      classes: 'quiz-list',
      _quizzes
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
                button(
                  onClick: () async {
                    setState(() {
                      _quizzes.remove(quiz);
                    });
                    await DbProvider.of(context).quiz.deleteQuiz(quiz);
                    if (mounted) {
                      _loadQuizzes();
                    }
                  },
                  [
                    i(classes: 'material-icons md-18', [text('delete')]),
                    text('Delete'),
                  ],
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
