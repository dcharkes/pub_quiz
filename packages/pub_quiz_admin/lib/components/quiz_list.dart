import 'package:jaspr/jaspr.dart';

import '../data/quiz.dart';

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
                    // Handle edit button press
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
