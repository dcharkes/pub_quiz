import 'dart:io';

import 'package:serverpod/serverpod.dart';

import 'ai/generative_ai.dart';
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

  Future<List<Quiz>> readQuizzes(Session session) async {
    return await Quiz.db.find(
      session,
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  Future<Quiz> updateQuiz(Session session, Quiz quiz) async {
    return await Quiz.db.updateRow(session, quiz);
  }

  Future<void> deleteQuiz(Session session, Quiz quiz) async {
    await Quiz.db.deleteRow(session, quiz);
  }

  Future<Quiz> generateQuiz(
    Session session, {
    required int numberOfQuestions,
    required String style,
    required String topic,
  }) async {
    final apiKey =
        session.passwords['geminiApiKey'] ??
        Platform.environment['GEMINI_API_KEY'];
    final quiz = await geminiGenerateQuiz(
      apiKey: apiKey!,
      numberOfQuestions: numberOfQuestions,
      style: style,
      topic: topic,
    );
    return await Quiz.db.insertRow(session, quiz);
  }
}
