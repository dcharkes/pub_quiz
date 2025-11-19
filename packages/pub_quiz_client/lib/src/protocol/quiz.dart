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
import 'game.dart' as _i3;

/// A quiz.
abstract class Quiz implements _i1.SerializableModel {
  Quiz._({
    this.id,
    required this.title,
    required this.questions,
    this.games,
  });

  factory Quiz({
    int? id,
    required String title,
    required List<_i2.Question> questions,
    List<_i3.Game>? games,
  }) = _QuizImpl;

  factory Quiz.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quiz(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      questions: (jsonSerialization['questions'] as List)
          .map((e) => _i2.Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
      games: (jsonSerialization['games'] as List?)
          ?.map((e) => _i3.Game.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The title of the quiz.
  String title;

  /// The questions in this quiz.
  List<_i2.Question> questions;

  /// The games played with this quiz.
  List<_i3.Game>? games;

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Quiz copyWith({
    int? id,
    String? title,
    List<_i2.Question>? questions,
    List<_i3.Game>? games,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      'questions': questions.toJson(valueToJson: (v) => v.toJson()),
      if (games != null) 'games': games?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    required String title,
    required List<_i2.Question> questions,
    List<_i3.Game>? games,
  }) : super._(
          id: id,
          title: title,
          questions: questions,
          games: games,
        );

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Quiz copyWith({
    Object? id = _Undefined,
    String? title,
    List<_i2.Question>? questions,
    Object? games = _Undefined,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      questions:
          questions ?? this.questions.map((e0) => e0.copyWith()).toList(),
      games: games is List<_i3.Game>?
          ? games
          : this.games?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
