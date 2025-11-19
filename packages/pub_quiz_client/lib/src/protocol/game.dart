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
import 'player.dart' as _i3;

/// A game.
abstract class Game implements _i1.SerializableModel {
  Game._({
    this.id,
    required this.quizId,
    this.quiz,
    required this.currentQuestion,
    required this.questionStart,
    required this.deadline,
    this.players,
  });

  factory Game({
    int? id,
    required int quizId,
    _i2.Quiz? quiz,
    required int currentQuestion,
    required DateTime questionStart,
    required DateTime deadline,
    List<_i3.Player>? players,
  }) = _GameImpl;

  factory Game.fromJson(Map<String, dynamic> jsonSerialization) {
    return Game(
      id: jsonSerialization['id'] as int?,
      quizId: jsonSerialization['quizId'] as int,
      quiz: jsonSerialization['quiz'] == null
          ? null
          : _i2.Quiz.fromJson(
              (jsonSerialization['quiz'] as Map<String, dynamic>)),
      currentQuestion: jsonSerialization['currentQuestion'] as int,
      questionStart: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['questionStart']),
      deadline:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deadline']),
      players: (jsonSerialization['players'] as List?)
          ?.map((e) => _i3.Player.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int quizId;

  /// Quiz this game belongs to.
  _i2.Quiz? quiz;

  /// Current question index. -1 if not started, quiz.questions.length if finished.
  int currentQuestion;

  /// Question start time.
  DateTime questionStart;

  /// Deadline for the current question.
  DateTime deadline;

  /// The game participants.
  List<_i3.Player>? players;

  /// Returns a shallow copy of this [Game]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Game copyWith({
    int? id,
    int? quizId,
    _i2.Quiz? quiz,
    int? currentQuestion,
    DateTime? questionStart,
    DateTime? deadline,
    List<_i3.Player>? players,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'quizId': quizId,
      if (quiz != null) 'quiz': quiz?.toJson(),
      'currentQuestion': currentQuestion,
      'questionStart': questionStart.toJson(),
      'deadline': deadline.toJson(),
      if (players != null)
        'players': players?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameImpl extends Game {
  _GameImpl({
    int? id,
    required int quizId,
    _i2.Quiz? quiz,
    required int currentQuestion,
    required DateTime questionStart,
    required DateTime deadline,
    List<_i3.Player>? players,
  }) : super._(
          id: id,
          quizId: quizId,
          quiz: quiz,
          currentQuestion: currentQuestion,
          questionStart: questionStart,
          deadline: deadline,
          players: players,
        );

  /// Returns a shallow copy of this [Game]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Game copyWith({
    Object? id = _Undefined,
    int? quizId,
    Object? quiz = _Undefined,
    int? currentQuestion,
    DateTime? questionStart,
    DateTime? deadline,
    Object? players = _Undefined,
  }) {
    return Game(
      id: id is int? ? id : this.id,
      quizId: quizId ?? this.quizId,
      quiz: quiz is _i2.Quiz? ? quiz : this.quiz?.copyWith(),
      currentQuestion: currentQuestion ?? this.currentQuestion,
      questionStart: questionStart ?? this.questionStart,
      deadline: deadline ?? this.deadline,
      players: players is List<_i3.Player>?
          ? players
          : this.players?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
