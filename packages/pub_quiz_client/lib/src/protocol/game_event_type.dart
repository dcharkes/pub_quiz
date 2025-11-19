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

enum GameEventType implements _i1.SerializableModel {
  start,
  question,
  player_joined,
  player_answered,
  end;

  static GameEventType fromJson(int index) {
    switch (index) {
      case 0:
        return GameEventType.start;
      case 1:
        return GameEventType.question;
      case 2:
        return GameEventType.player_joined;
      case 3:
        return GameEventType.player_answered;
      case 4:
        return GameEventType.end;
      default:
        throw ArgumentError(
            'Value "$index" cannot be converted to "GameEventType"');
    }
  }

  @override
  int toJson() => index;

  @override
  String toString() => name;
}
