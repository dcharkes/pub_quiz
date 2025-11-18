import 'package:jaspr/jaspr.dart';

import '../data/quiz.dart';

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
          'placeholder': 'Title',
        },
        onInput: (value) {
          setState(() {
            title = value as String;
          });
        },
      ),
      for (final question in questions) div([]),
      button(
        onClick: () {
          setState(() {
            questions.add(Question(question: '', answers: List.filled(4, '')));
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
