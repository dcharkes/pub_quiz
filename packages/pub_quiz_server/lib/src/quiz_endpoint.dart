import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class QuizEndpoint extends Endpoint {
  Future<void> createQuiz(Quiz quiz) async {}

  // TODO(dacoharkes): What should the API be? quizId? Quiz? No quiz object at
  // all because we already have a reference to it in the question object?
  Future<void> addQuestion(Question question, int quizId) async {}
}
