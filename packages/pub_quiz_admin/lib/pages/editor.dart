import 'package:jaspr/jaspr.dart';

import 'package:pub_quiz_client/pub_quiz_client.dart';

import '../components/question_editor.dart';

class QuizEditor extends StatefulComponent {
  const QuizEditor({super.key});

  @override
  State<QuizEditor> createState() => _CounterState();
}

class _CounterState extends State<QuizEditor> {
  String title = '';
  List<Question> questions = [];

  @override
  Component build(BuildContext context) {
    return div([
      h1(classes: 'page-header', [text('Quiz Editor')]),
      input(
        type: InputType.text,
        value: title,
        attributes: {
          'placeholder': 'Quiz Title',
        },
        onInput: (value) {
          setState(() {
            title = value as String;
          });
        },
      ),
      for (final question in questions) QuestionEditor(question: question),
      button(
        onClick: () {
          setState(() {
            questions.add(
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
