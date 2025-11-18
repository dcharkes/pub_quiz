/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'quiz.dart' as _i2;
import 'answer.dart' as _i3;

/// A question in a quiz.
abstract class Question implements _i1.SerializableModel {
  Question._({
    this.id,
    required this.quizId,
    this.quiz,
    required this.question,
    this.answers,
  });

  factory Question({
    int? id,
    required int quizId,
    _i2.Quiz? quiz,
    required String question,
    List<_i3.Answer>? answers,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      id: jsonSerialization['id'] as int?,
      quizId: jsonSerialization['quizId'] as int,
      quiz: jsonSerialization['quiz'] == null
          ? null
          : _i2.Quiz.fromJson(
              (jsonSerialization['quiz'] as Map<String, dynamic>)),
      question: jsonSerialization['question'] as String,
      answers: (jsonSerialization['answers'] as List?)
          ?.map((e) => _i3.Answer.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int quizId;

  _i2.Quiz? quiz;

  /// The question.
  String question;

  /// The answers to this question
  List<_i3.Answer>? answers;

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Question copyWith({
    int? id,
    int? quizId,
    _i2.Quiz? quiz,
    String? question,
    List<_i3.Answer>? answers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'quizId': quizId,
      if (quiz != null) 'quiz': quiz?.toJson(),
      'question': question,
      if (answers != null)
        'answers': answers?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required int quizId,
    _i2.Quiz? quiz,
    required String question,
    List<_i3.Answer>? answers,
  }) : super._(
          id: id,
          quizId: quizId,
          quiz: quiz,
          question: question,
          answers: answers,
        );

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Question copyWith({
    Object? id = _Undefined,
    int? quizId,
    Object? quiz = _Undefined,
    String? question,
    Object? answers = _Undefined,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      quizId: quizId ?? this.quizId,
      quiz: quiz is _i2.Quiz? ? quiz : this.quiz?.copyWith(),
      question: question ?? this.question,
      answers: answers is List<_i3.Answer>?
          ? answers
          : this.answers?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
