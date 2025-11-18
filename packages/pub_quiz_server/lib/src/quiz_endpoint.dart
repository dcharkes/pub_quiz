import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class QuizEndpoint extends Endpoint {
  Future<Quiz> createQuiz(Session session, Quiz quiz) async {
    return await Quiz.db.insertRow(session, quiz);
  }

  Future<Question> createQuestion(Session session, Question question) async {
    return await Question.db.insertRow(session, question);
  }

  Future<Quiz?> loadQuiz(Session session, int id) async {
    return await Quiz.db.findById(
      session,
      id,
      include: Quiz.include(
        questions: Question.includeList(),
      ),
    );
  }
}
