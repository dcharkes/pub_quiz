import 'package:pub_quiz_client/pub_quiz_client.dart';
import 'package:test/test.dart';

final testData = Quiz(
  title: 'The Great Dart Hackathon Survival Quiz',
  questions: [
    // Question 1: The classic ecosystem debate
    Question(
      question:
          'The hackathon timer has started. '
          'What is the first thing your team does?',
      answers: [
        Answer(
          text: 'Immediately start coding the core features.',
          correct: false,
        ),
        Answer(
          text: 'Spend 4 hours arguing about Riverpod vs. Bloc vs. GetX.',
          correct: true,
        ),
        Answer(
          text: 'Read the actual hackathon rules.',
          correct: false,
        ),
        Answer(
          text: 'Download the internet via "pub get".',
          correct: false,
        ),
      ],
    ),

    // Question 2: Jaspr vs Flutter Web
    Question(
      question: 'Why did the team decide to use Jaspr instead of Flutter Web?',
      answers: [
        Answer(
          text: 'Because they love DOM elements more than Canvas pixels.',
          correct: false,
        ),
        Answer(
          text: 'They wanted their "Hello World" app to be smaller than 5MB.',
          correct: true,
        ),
        Answer(
          text: 'They thought Jaspr was the friendly ghost.',
          correct: false,
        ),
        Answer(
          text:
              'They wanted to confuse the React developers by writing HTML '
              'in Dart.',
          correct: false,
        ),
      ],
    ),

    // Question 3: The Deadline Panic
    Question(
      question:
          'It is 10 minutes before the demo and the build is failing. '
          'What is the fix?',
      answers: [
        Answer(
          text: 'Run "flutter clean" and pray to the Tim Sneath.',
          correct: false,
        ),
        Answer(
          text: 'Properly debug the stack trace.',
          correct: false,
        ),
        Answer(
          text: 'Hardcode the JSON response and pretend the backend works.',
          correct: true,
        ),
        Answer(
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
