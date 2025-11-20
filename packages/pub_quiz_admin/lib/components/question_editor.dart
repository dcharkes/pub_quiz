import 'package:jaspr/jaspr.dart';

import 'package:pub_quiz_client/pub_quiz_client.dart' hide VoidCallback;

class QuestionEditor extends StatefulComponent {
  const QuestionEditor({
    super.key,
    required this.question,
    required this.onDelete,
  });

  final Question question;
  final VoidCallback onDelete;

  @override
  State<QuestionEditor> createState() => _QuizQuestionEditorState();
}

class _QuizQuestionEditorState extends State<QuestionEditor> {
  @override
  Component build(BuildContext context) {
    return div(
      classes: 'question-editor',
      [
        div(
          classes: 'form-group',
          [
            label(htmlFor: 'question-title', [text('Question')]),
            input(
              id: 'question-title',
              type: InputType.text,
              value: component.question.question,
              attributes: {
                'placeholder': 'Enter your question',
              },
              onInput: (value) {
                setState(() {
                  component.question.question = value as String;
                });
              },
            ),
          ],
        ),
        div(
          classes: 'answers-container',
          [
            h3([text('Answers')]),
            ...component.question.answers.asMap().entries.map((entry) {
              final index = entry.key;
              final answer = entry.value;

              return div(
                classes: 'grid',
                [
                  input(
                    type: InputType.text,
                    value: answer.text,
                    attributes: {
                      'placeholder': 'Answer ${index + 1}',
                    },
                    onInput: (value) {
                      setState(() {
                        answer.text = value as String;
                      });
                    },
                  ),
                  div(
                    classes: 'answer-actions',
                    [
                      label([
                        input(
                          type: InputType.checkbox,
                          checked: answer.correct,
                          onInput: (value) {
                            setState(() {
                              answer.correct = value as bool;
                            });
                          },
                        ),
                        text('Correct'),
                      ]),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
        button(
          onClick: component.onDelete,
          classes: 'secondary',
          [
            i(classes: 'material-icons md-18', [text('delete')]),
            text('Delete'),
          ],
        ),
      ],
    );
  }
}
