import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import '../components/db.dart';

class GenerateQuizPage extends StatefulComponent {
  const GenerateQuizPage({super.key});

  @override
  State<GenerateQuizPage> createState() => _GenerateQuizPageState();
}

class _GenerateQuizPageState extends State<GenerateQuizPage> {
  int _numberOfQuestions = 10;
  String _style = 'Funny';
  String _topic = 'A hackathon with Dart, Flutter, and Jaspr';
  bool _isLoading = false;
  String? _error;

  void _generateQuiz() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final db = DbProvider.of(context);
      final quiz = await db.quiz.generateQuiz(
        numberOfQuestions: _numberOfQuestions,
        style: _style,
        topic: _topic,
      );
      if (mounted) {
        await Router.of(context).push('/');
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Component build(BuildContext context) {
    return section(classes: 'container', [
      h1([text('Generate Quiz with AI')]),
      form([
        div(classes: 'form-group', [
          label([text('Topic')]),
          input(
            type: InputType.text,
            value: _topic,
            disabled: _isLoading,
            onInput: (value) {
              _topic = value as String;
            },
          ),
        ]),
        div(classes: 'form-group', [
          label([text('Style')]),
          select(
            value: _style,
            disabled: _isLoading,
            onChange: (value) {
              setState(() {
                _style = value.single;
              });
            },
            [
              option(value: 'Funny', [text('Funny')]),
              option(value: 'Nerdy', [text('Nerdy')]),
              option(value: 'Challenging', [text('Challenging')]),
              option(value: 'Strange', [text('Strange')]),
            ],
          ),
        ]),
        div(classes: 'form-group', [
          label([text('Number of Questions')]),
          select(
            value: _numberOfQuestions.toString(),
            disabled: _isLoading,
            onChange: (value) {
              setState(() {
                _numberOfQuestions = int.parse(value.single);
              });
            },
            [
              option(value: '10', [text('10')]),
              option(value: '15', [text('15')]),
              option(value: '20', [text('20')]),
            ],
          ),
        ]),
        div(
          classes: 'grid',
          [
            button(
              classes: 'icon-button',
              onClick: _generateQuiz,
              disabled: _isLoading,
              [
                if (_isLoading) ...[
                  span(classes: 'loading-indicator', []),
                  text('Generating...'),
                ] else ...[
                  i(classes: 'material-icons icon', [text('auto_awesome')]),
                  text('Generate'),
                ],
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
        if (_error != null)
          div(classes: 'error-message', [
            text(_error!),
          ]),
      ]),
    ]);
  }
}
