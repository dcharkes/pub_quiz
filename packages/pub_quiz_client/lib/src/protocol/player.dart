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
import 'game.dart' as _i2;

/// A player in a game
abstract class Player implements _i1.SerializableModel {
  Player._({
    this.id,
    required this.gameId,
    this.game,
    required this.name,
    required this.score,
  });

  factory Player({
    int? id,
    required int gameId,
    _i2.Game? game,
    required String name,
    required int score,
  }) = _PlayerImpl;

  factory Player.fromJson(Map<String, dynamic> jsonSerialization) {
    return Player(
      id: jsonSerialization['id'] as int?,
      gameId: jsonSerialization['gameId'] as int,
      game: jsonSerialization['game'] == null
          ? null
          : _i2.Game.fromJson(
              (jsonSerialization['game'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      score: jsonSerialization['score'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int gameId;

  _i2.Game? game;

  /// Player name, must not be unique.
  String name;

  /// Player score so far.
  int score;

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Player copyWith({
    int? id,
    int? gameId,
    _i2.Game? game,
    String? name,
    int? score,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'gameId': gameId,
      if (game != null) 'game': game?.toJson(),
      'name': name,
      'score': score,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PlayerImpl extends Player {
  _PlayerImpl({
    int? id,
    required int gameId,
    _i2.Game? game,
    required String name,
    required int score,
  }) : super._(
          id: id,
          gameId: gameId,
          game: game,
          name: name,
          score: score,
        );

  /// Returns a shallow copy of this [Player]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Player copyWith({
    Object? id = _Undefined,
    int? gameId,
    Object? game = _Undefined,
    String? name,
    int? score,
  }) {
    return Player(
      id: id is int? ? id : this.id,
      gameId: gameId ?? this.gameId,
      game: game is _i2.Game? ? game : this.game?.copyWith(),
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }
}
