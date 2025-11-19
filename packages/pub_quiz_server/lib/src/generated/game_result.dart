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
import 'player.dart' as _i2;

abstract class GameResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GameResult._({required this.scores});

  factory GameResult({required List<_i2.Player> scores}) = _GameResultImpl;

  factory GameResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameResult(
        scores: (jsonSerialization['scores'] as List)
            .map((e) => _i2.Player.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.Player> scores;

  /// Returns a shallow copy of this [GameResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameResult copyWith({List<_i2.Player>? scores});
  @override
  Map<String, dynamic> toJson() {
    return {'scores': scores.toJson(valueToJson: (v) => v.toJson())};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'scores': scores.toJson(valueToJson: (v) => v.toJsonForProtocol())};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GameResultImpl extends GameResult {
  _GameResultImpl({required List<_i2.Player> scores}) : super._(scores: scores);

  /// Returns a shallow copy of this [GameResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameResult copyWith({List<_i2.Player>? scores}) {
    return GameResult(
        scores: scores ?? this.scores.map((e0) => e0.copyWith()).toList());
  }
}
