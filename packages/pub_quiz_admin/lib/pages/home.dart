import 'package:jaspr/jaspr.dart';

import '../components/quiz_list.dart';
import '../data/quiz.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    final quizzes = [
      Quiz(
        title: 'Quiz 1',
        questions: [
          Question(
            question: 'Question 1',
            answers: ['Answer 1', 'Answer 2', 'Answer 3', 'Answer 4'],
          ),
        ],
      ),
      Quiz(
        title: 'Quiz 2',
        questions: [
          Question(
            question: 'Question 1',
            answers: ['Answer 1', 'Answer 2', 'Answer 3', 'Answer 4'],
          ),
        ],
      ),
    ];

    return div([
      h1([text('Pub Quiz Admin')], classes: 'page-header'),
      div([
        button(
          onClick: () {
            // Handle add new quiz button press
          },
          [
            i(classes: 'material-icons md-18', [text('add')]),
            text('Add New Quiz'),
          ],
          classes: 'add-quiz-button',
        ),
      ]),
      QuizList(quizzes: quizzes),
    ]);
  }
}
