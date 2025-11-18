import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:test/test.dart';

const _quizId = 1;
const _questionId1 = 1;
const _questionId2 = 2;
const _questionId3 = 3;
final testData = Quiz(
  id: _quizId,
  title: 'The Great Dart Hackathon Survival Quiz',
  questions: [
    // Question 1: The classic ecosystem debate
    Question(
      quizId: _quizId,
      id: _questionId1,
      question:
          'The hackathon timer has started. '
          'What is the first thing your team does?',
      answers: [
        Answer(
          questionId: _questionId1,
          text: 'Immediately start coding the core features.',
          correct: false,
        ),
        Answer(
          questionId: _questionId1,
          text: 'Spend 4 hours arguing about Riverpod vs. Bloc vs. GetX.',
          correct: true,
        ),
        Answer(
          questionId: _questionId1,
          text: 'Read the actual hackathon rules.',
          correct: false,
        ),
        Answer(
          questionId: _questionId1,
          text: 'Download the internet via "pub get".',
          correct: false,
        ),
      ],
    ),

    // Question 2: Jaspr vs Flutter Web
    Question(
      quizId: _quizId,
      id: _questionId2,
      question: 'Why did the team decide to use Jaspr instead of Flutter Web?',
      answers: [
        Answer(
          questionId: _questionId2,
          text: 'Because they love DOM elements more than Canvas pixels.',
          correct: false,
        ),
        Answer(
          questionId: _questionId2,
          text: 'They wanted their "Hello World" app to be smaller than 5MB.',
          correct: true,
        ),
        Answer(
          questionId: _questionId2,
          text: 'They thought Jaspr was the friendly ghost.',
          correct: false,
        ),
        Answer(
          questionId: _questionId2,
          text:
              'They wanted to confuse the React developers by writing HTML '
              'in Dart.',
          correct: false,
        ),
      ],
    ),

    // Question 3: The Deadline Panic
    Question(
      quizId: _quizId,
      id: _questionId3,
      question:
          'It is 10 minutes before the demo and the build is failing. '
          'What is the fix?',
      answers: [
        Answer(
          questionId: _questionId3,
          text: 'Run "flutter clean" and pray to the Tim Sneath.',
          correct: false,
        ),
        Answer(
          questionId: _questionId3,
          text: 'Properly debug the stack trace.',
          correct: false,
        ),
        Answer(
          questionId: _questionId3,
          text: 'Hardcode the JSON response and pretend the backend works.',
          correct: true,
        ),
        Answer(
          questionId: _questionId3,
          text: 'Switch to Light Mode so the bugs are harder to see.',
          correct: false,
        ),
      ],
    ),
  ],
);

void main() {
  test('test data structure', () {
    expect(testData.toJson(), isMap);
  });
}
