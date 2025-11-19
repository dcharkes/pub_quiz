/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'answer.dart' as _i2;

/// A question in a quiz.
abstract class Question
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Question._({
    required this.question,
    required this.answers,
  });

  factory Question({
    required String question,
    required List<_i2.Answer> answers,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      question: jsonSerialization['question'] as String,
      answers: (jsonSerialization['answers'] as List)
          .map((e) => _i2.Answer.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The question.
  String question;

  /// The answers to this question
  List<_i2.Answer> answers;

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Question copyWith({
    String? question,
    List<_i2.Answer>? answers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answers': answers.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'question': question,
      'answers': answers.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _QuestionImpl extends Question {
  _QuestionImpl({
    required String question,
    required List<_i2.Answer> answers,
  }) : super._(
          question: question,
          answers: answers,
        );

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Question copyWith({
    String? question,
    List<_i2.Answer>? answers,
  }) {
    return Question(
      question: question ?? this.question,
      answers: answers ?? this.answers.map((e0) => e0.copyWith()).toList(),
    );
  }
}
