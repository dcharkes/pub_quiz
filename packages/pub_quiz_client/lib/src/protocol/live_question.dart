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

abstract class LiveQuestion implements _i1.SerializableModel {
  LiveQuestion._({
    required this.question,
    required this.index,
    required this.startedAt,
    required this.deadline,
  });

  factory LiveQuestion({
    required _i2.Question question,
    required int index,
    required DateTime startedAt,
    required DateTime deadline,
  }) = _LiveQuestionImpl;

  factory LiveQuestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return LiveQuestion(
      question: _i2.Question.fromJson(
          (jsonSerialization['question'] as Map<String, dynamic>)),
      index: jsonSerialization['index'] as int,
      startedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startedAt']),
      deadline:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
    );
  }

  _i2.Question question;

  int index;

  DateTime startedAt;

  DateTime deadline;

  /// Returns a shallow copy of this [LiveQuestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LiveQuestion copyWith({
    _i2.Question? question,
    int? index,
    DateTime? startedAt,
    DateTime? deadline,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'question': question.toJson(),
      'index': index,
      'startedAt': startedAt.toJson(),
      'deadline': deadline.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LiveQuestionImpl extends LiveQuestion {
  _LiveQuestionImpl({
    required _i2.Question question,
    required int index,
    required DateTime startedAt,
    required DateTime deadline,
  }) : super._(
          question: question,
          index: index,
          startedAt: startedAt,
          deadline: deadline,
        );

  /// Returns a shallow copy of this [LiveQuestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LiveQuestion copyWith({
    _i2.Question? question,
    int? index,
    DateTime? startedAt,
    DateTime? deadline,
  }) {
    return LiveQuestion(
      question: question ?? this.question.copyWith(),
      index: index ?? this.index,
      startedAt: startedAt ?? this.startedAt,
      deadline: deadline ?? this.deadline,
    );
  }
}
