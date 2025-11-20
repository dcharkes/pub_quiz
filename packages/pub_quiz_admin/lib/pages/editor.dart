import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'package:pub_quiz_client/pub_quiz_client.dart';

import '../components/db.dart';
import '../components/question_editor.dart';

class QuizEditor extends StatefulComponent {
  const QuizEditor({super.key, this.quizId});

  final int? quizId;

  @override
  State<QuizEditor> createState() => _QuizEditorState();
}

class _QuizEditorState extends State<QuizEditor> {
  Quiz? _quiz;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadQuiz();
  }

  void _loadQuiz() async {
    final quizId = component.quizId;
    if (quizId != null) {
      final quiz = await DbProvider.of(context).quiz.readQuiz(quizId);
      if (mounted) {
        setState(() {
          _quiz = quiz;
        });
      }
    }
    if (_quiz == null) {
      setState(() {
        _quiz = Quiz(title: '', questions: []);
      });
    }
  }

  @override
  Component build(BuildContext context) {
    return section(classes: 'container', [
      header(classes: 'page-header', [
        h1([text('Quiz Editor')]),
      ]),
      if (_quiz != null)
        div([
          div(
            classes: 'form-group',
            [
              h3([text('Quiz Title')]),
              input(
                id: 'quiz-title',
                type: InputType.text,
                value: _quiz!.title,
                attributes: {
                  'placeholder': 'Enter quiz title',
                },
                onInput: (value) {
                  setState(() {
                    _quiz!.title = value as String;
                  });
                },
              ),
            ],
          ),
          div(
            classes: 'question-list',
            [
              for (final question in _quiz!.questions)
                QuestionEditor(
                  question: question,
                  onDelete: () {
                    setState(() {
                      _quiz!.questions.remove(question);
                    });
                  },
                ),
            ],
          ),
          button(
            classes: 'add-question-button icon-button',
            onClick: () {
              setState(() {
                _quiz!.questions.add(
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
            [
              i(classes: 'material-icons icon', [text('add')]),
              text('Add Question'),
            ],
          ),
          div(
            classes: 'grid',
            [
              button(
                classes: 'save-button icon-button',
                onClick: () {
                  final db = DbProvider.of(context).quiz;
                  final newQuiz = _quiz!.id == null
                      ? db.createQuiz(_quiz!)
                      : db.updateQuiz(_quiz!);
                  newQuiz.then((quiz) {
                    print(quiz.id);
                    if (mounted) {
                      setState(() {
                        _quiz = quiz;
                      });
                    }
                    Router.of(context).push('/');
                  });
                },
                [
                  i(classes: 'material-icons icon', [text('save')]),
                  text('Save Quiz'),
                ],
              ),
              button(
                classes: 'cancel-button secondary icon-button',
                onClick: () {
                  Router.of(context).push('/');
                },
                [
                  i(classes: 'material-icons icon', [text('cancel')]),
                  text('Cancel'),
                ],
              ),
            ],
          ),
        ]),
    ]);
  }
}
