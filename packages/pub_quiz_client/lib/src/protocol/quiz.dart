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
import 'question.dart' as _i2;

/// A quiz.
abstract class Quiz implements _i1.SerializableModel {
  Quiz._({
    required this.title,
    required this.questions,
  });

  factory Quiz({
    required String title,
    required List<_i2.Question> questions,
  }) = _QuizImpl;

  factory Quiz.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quiz(
      title: jsonSerialization['title'] as String,
      questions: (jsonSerialization['questions'] as List)
          .map((e) => _i2.Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The title of the quiz.
  String title;

  /// The questions in this quiz.
  List<_i2.Question> questions;

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Quiz copyWith({
    String? title,
    List<_i2.Question>? questions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'questions': questions.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _QuizImpl extends Quiz {
  _QuizImpl({
    required String title,
    required List<_i2.Question> questions,
  }) : super._(
          title: title,
          questions: questions,
        );

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Quiz copyWith({
    String? title,
    List<_i2.Question>? questions,
  }) {
    return Quiz(
      title: title ?? this.title,
      questions:
          questions ?? this.questions.map((e0) => e0.copyWith()).toList(),
    );
  }
}
