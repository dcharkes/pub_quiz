import 'package:jaspr/jaspr.dart';

import 'package:pub_quiz_client/pub_quiz_client.dart';

import '../components/question_editor.dart';

class QuizEditor extends StatefulComponent {
  const QuizEditor({super.key, this.quiz});

  final Quiz? quiz;

  @override
  State<QuizEditor> createState() => _CounterState();
}

class _CounterState extends State<QuizEditor> {
  late final _quizCache = Quiz(title: '', questions: []);

  Quiz get quiz => component.quiz ?? _quizCache;

  @override
  Component build(BuildContext context) {
    return section([
      h1(classes: 'page-header', [text('Quiz Editor')]),
      div(
        classes: 'form-group',
        [
          label(htmlFor: 'quiz-title', [text('Quiz Title')]),
          input(
            id: 'quiz-title',
            type: InputType.text,
            value: quiz.title,
            attributes: {
              'placeholder': 'Enter quiz title',
            },
            onInput: (value) {
              setState(() {
                quiz.title = value as String;
              });
            },
          ),
        ],
      ),
      div(
        classes: 'question-list',
        [
          for (final question in quiz.questions)
            QuestionEditor(question: question),
        ],
      ),
      button(
        onClick: () {
          setState(() {
            quiz.questions.add(
              Question(
                question: '',
                answers: List.generate(
                  4,
                  (index) => Answer(text: '', correct: false),
                ),
              ),
            );
          });
        },
        classes: 'add-question-button',
        [
          i(classes: 'material-icons md-18', [text('add')]),
          text('Add Question'),
        ],
      ),
    ]);
  }
}
