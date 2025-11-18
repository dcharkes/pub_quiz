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

/// An answer to a question.
abstract class Answer implements _i1.SerializableModel {
  Answer._({
    required this.text,
    required this.correct,
  });

  factory Answer({
    required String text,
    required bool correct,
  }) = _AnswerImpl;

  factory Answer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Answer(
      text: jsonSerialization['text'] as String,
      correct: jsonSerialization['correct'] as bool,
    );
  }

  /// The text representation of this answer.
  String text;

  /// Whether this answer is correct.
  bool correct;

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Answer copyWith({
    String? text,
    bool? correct,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'correct': correct,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AnswerImpl extends Answer {
  _AnswerImpl({
    required String text,
    required bool correct,
  }) : super._(
          text: text,
          correct: correct,
        );

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Answer copyWith({
    String? text,
    bool? correct,
  }) {
    return Answer(
      text: text ?? this.text,
      correct: correct ?? this.correct,
    );
  }
}
