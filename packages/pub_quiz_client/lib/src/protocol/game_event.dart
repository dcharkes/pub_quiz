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
import 'game_event_type.dart' as _i2;
import 'game.dart' as _i3;
import 'player.dart' as _i4;

/// Game lifecycle event.
abstract class GameEvent implements _i1.SerializableModel {
  GameEvent._({
    required this.type,
    required this.game,
    this.player,
  });

  factory GameEvent({
    required _i2.GameEventType type,
    required _i3.Game game,
    _i4.Player? player,
  }) = _GameEventImpl;

  factory GameEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameEvent(
      type: _i2.GameEventType.fromJson((jsonSerialization['type'] as int)),
      game: _i3.Game.fromJson(
          (jsonSerialization['game'] as Map<String, dynamic>)),
      player: jsonSerialization['player'] == null
          ? null
          : _i4.Player.fromJson(
              (jsonSerialization['player'] as Map<String, dynamic>)),
    );
  }

  /// Event type.
  _i2.GameEventType type;

  /// Game this event belongs to.
  _i3.Game game;

  /// Associated player. Set only for `player_joined` and `player_answered` events.
  _i4.Player? player;

  /// Returns a shallow copy of this [GameEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameEvent copyWith({
    _i2.GameEventType? type,
    _i3.Game? game,
    _i4.Player? player,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'game': game.toJson(),
      if (player != null) 'player': player?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameEventImpl extends GameEvent {
  _GameEventImpl({
    required _i2.GameEventType type,
    required _i3.Game game,
    _i4.Player? player,
  }) : super._(
          type: type,
          game: game,
          player: player,
        );

  /// Returns a shallow copy of this [GameEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameEvent copyWith({
    _i2.GameEventType? type,
    _i3.Game? game,
    Object? player = _Undefined,
  }) {
    return GameEvent(
      type: type ?? this.type,
      game: game ?? this.game.copyWith(),
      player: player is _i4.Player? ? player : this.player?.copyWith(),
    );
  }
}
