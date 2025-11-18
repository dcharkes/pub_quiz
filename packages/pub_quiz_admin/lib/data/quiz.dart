class Quiz {
  const Quiz({required this.title, required this.questions});

  final String title;
  final List<Question> questions;
}

class Question {
  const Question({required this.question, required this.answers}) : assert(answers.length == 4);

  final String question;
  final List<String> answers;
}
