import 'package:jaspr/jaspr.dart';

import 'package:pub_quiz_client/pub_quiz_client.dart';

class QuestionEditor extends StatefulComponent {
  const QuestionEditor({super.key, required this.question});

  final Question question;

  @override
  State<QuestionEditor> createState() => _QuizQuestionEditorState();
}

class _QuizQuestionEditorState extends State<QuestionEditor> {
  void _onTitleChange(String newTitle) {
    setState(() {
      component.question.question = newTitle;
    });
  }

  void _onAnswerTextChange(int index, String newText) {
    print(index);
    setState(() {
      component.question.answers[index].text = newText;
    });
  }

  void _onAnswerCorrectChange(int index, bool? isCorrect) {
    setState(() {
      component.question.answers[index].correct = isCorrect ?? false;
    });
  }

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'quiz-editor',
      [
        div(
          classes: 'field-group',
          [
            label(htmlFor: 'question-title', [text('Question Title')]),
            input(
              id: 'question-title',
              type: InputType.text,
              value: component.question.question,
              onInput: (value) {
                _onTitleChange(value as String);
              },
            ),
          ],
        ),

        h3([text('Answers')]),
        ...component.question.answers.asMap().entries.map((entry) {
          final index = entry.key;
          final answer = entry.value;

          return div(
            classes: 'answer-field',
            [
              input(
                type: InputType.text,
                value: answer.text,
                onInput: (value) {
                  _onAnswerTextChange(index, value as String);
                },
              ),

              label([
                input(
                  type: InputType.checkbox,
                  checked: answer.correct,
                  onInput: (value) {
                    _onAnswerCorrectChange(index, value as bool);
                  },
                ),
                text(' Correct'),
              ]),
            ],
          );
        }),
      ],
    );
  }
}
