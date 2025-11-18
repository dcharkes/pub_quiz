import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

import '../components/quiz_list.dart';

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
            answers: [
              Answer(text: 'Answer 1', correct: true),
              Answer(text: 'Answer 2', correct: true),
              Answer(text: 'Answer 3', correct: true),
              Answer(text: 'Answer 4', correct: true),
            ],
          ),
        ],
      ),
      Quiz(
        title: 'Quiz 2',
        questions: [
          Question(
            question: 'Question 1',
            answers: [
              Answer(text: 'Answer 1', correct: true),
              Answer(text: 'Answer 2', correct: true),
              Answer(text: 'Answer 3', correct: true),
              Answer(text: 'Answer 4', correct: true),
            ],
          ),
        ],
      ),
    ];

    return div([
      h1(classes: 'page-header', [text('Pub Quiz Admin')]),
      div([
        button(
          onClick: () {
            Router.of(context).push('/editor');
          },
          classes: 'add-quiz-button',
          [
            i(classes: 'material-icons md-18', [text('add')]),
            text('Add New Quiz'),
          ],
        ),
      ]),
      QuizList(quizzes: quizzes),
    ]);
  }
}
