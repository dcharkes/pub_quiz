import 'package:serverpod/serverpod.dart';

import 'generated/protocol.dart';

class QuizEndpoint extends Endpoint {
  Future<Quiz> createQuiz(Session session, Quiz quiz) async {
    return await Quiz.db.insertRow(session, quiz);
  }

  Future<Quiz?> readQuiz(Session session, int id) async {
    return await Quiz.db.findById(
      session,
      id,
    );
  }

  Future<Quiz> updateQuiz(Session session, Quiz quiz) async {
    return await Quiz.db.updateRow(session, quiz);
  }

  Future<void> deleteQuiz(Session session, Quiz quiz) async {
    await Quiz.db.deleteRow(session, quiz);
  }
}
