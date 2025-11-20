import 'dart:convert';
import 'dart:math';

import 'package:google_generative_ai/google_generative_ai.dart';

import '../generated/quiz.dart';

Future<Quiz> geminiGenerateQuiz({
  int numberOfQuestions = 10,
  String style = 'funny',
  String topic = 'A hackathon with Dart, Flutter, and Jaspr.',
  required String apiKey,
}) async {
  final model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      responseMimeType: 'application/json',
    ),
  );

  final chatSession = model.startChat();

  final response = await chatSession.sendMessage(
    Content.text('''
Act as an expert Pub Quiz Master.
I need you to generate a JSON object containing a quiz on the topic of **$topic**.

The output must be valid JSON that matches the specific structure below.

**Configuration:**
1.  **Topic:** $topic
2.  **Tone:** $style
3.  **Count:** Generate $numberOfQuestions questions.

**Critical Constraints:**
* **Answers:** Every single question must have EXACTLY 4 possible answers.
* **Correctness:** Exactly one answer must be marked `true`, and the other three must be `false`.
* **Distractors:** The wrong answers should be plausible but incorrect.

**JSON Output Template:**
```json
{
  "title": "The title of the quiz goes here",
  "questions": [
    {
      "question": "The question text goes here?",
      "answers": [
        { "text": "Option A", "correct": false },
        { "text": "Option B", "correct": true },
        { "text": "Option C", "correct": false },
        { "text": "Option D", "correct": false }
      ]
    }
  ]
}
```
'''),
  );
  final jsonResponse = json.decode(response.text!) as Map<String, dynamic>;
  final quiz = Quiz.fromJson(jsonResponse);

  for (final question in quiz.questions) {
    question.answers.shuffle(Random());
  }

  return quiz;
}
