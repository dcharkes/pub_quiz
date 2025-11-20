import 'dart:js_interop';

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
    return table(
      [
        thead(
          [
            tr(
              [
                th(colspan: 2, [text('Quizzes')]),
              ],
            ),
          ],
        ),
        tbody(
          _quizzes
              .map(
                (quiz) => tr(
                  [
                    td(classes: 'quiz-title-column', [text(quiz.title)]),
                    td(
                      classes: 'quiz-actions-column',
                      [
                        div(
                          classes: 'grid',
                          [
                            button(
                              onClick: () {
                                Router.of(context).push('/edit/${quiz.id}');
                              },
                              [
                                i(classes: 'material-icons md-18', [
                                  text('edit'),
                                ]),
                                text('Edit'),
                              ],
                            ),
                            button(
                              onClick: () async {
                                setState(() {
                                  _quizzes.remove(quiz);
                                });
                                await DbProvider.of(
                                  context,
                                ).quiz.deleteQuiz(quiz);
                                if (mounted) {
                                  _loadQuizzes();
                                }
                              },
                              classes: 'secondary',
                              [
                                i(classes: 'material-icons md-18', [
                                  text('delete'),
                                ]),
                                text('Delete'),
                              ],
                            ),
                            button(
                              onClick: () async {
                                final pin = await DbProvider.of(
                                  context,
                                ).game.startGame(quiz.id!);
                                const tvAppUrlFromEnv = String.fromEnvironment(
                                  'TV_URL',
                                );
                                final tvUrl = tvAppUrlFromEnv.isEmpty
                                    ? 'http://localhost:58860/#/game/$pin'
                                    : 'https://$tvAppUrlFromEnv/#/game/$pin';
                                openWindow(tvUrl, '_blank');
                              },
                              [
                                i(classes: 'material-icons md-18', [
                                  text('play_arrow'),
                                ]),
                                text('Play'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

@JS('window.open')
external void openWindow(String url, String target);
