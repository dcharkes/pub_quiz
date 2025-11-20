import 'package:flutter/material.dart';
import 'package:pub_quiz_client/pub_quiz_client.dart';

class QuestionScreen extends StatelessWidget {
  final LiveQuestion question;
  final String quizTitle;
  final int timeLeft;
  final ValueChanged<int> onAnswerSelected;

  const QuestionScreen({
    super.key,
    required this.question,
    required this.quizTitle,
    required this.timeLeft,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final answers = question.question.answers;

    return Scaffold(
      appBar: AppBar(title: Text(quizTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Timer
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value:
                          timeLeft /
                          10.0, // Assuming 10s max for now, or pass maxTime
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '$timeLeft s',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Question Card
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text(
                          question.question.question,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // Answers List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: answers.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final answer = answers[index];
                  return SizedBox(
                    height: 64, // Fixed height for better touch targets
                    child: FilledButton(
                      onPressed: () => onAnswerSelected(index),
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(answer.text),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
