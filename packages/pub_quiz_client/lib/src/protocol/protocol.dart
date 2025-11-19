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
import 'answer.dart' as _i2;
import 'game.dart' as _i3;
import 'player.dart' as _i4;
import 'question.dart' as _i5;
import 'quiz.dart' as _i6;
import 'package:pub_quiz_client/src/protocol/quiz.dart' as _i7;
export 'answer.dart';
export 'game.dart';
export 'player.dart';
export 'question.dart';
export 'quiz.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Answer) {
      return _i2.Answer.fromJson(data) as T;
    }
    if (t == _i3.Game) {
      return _i3.Game.fromJson(data) as T;
    }
    if (t == _i4.Player) {
      return _i4.Player.fromJson(data) as T;
    }
    if (t == _i5.Question) {
      return _i5.Question.fromJson(data) as T;
    }
    if (t == _i6.Quiz) {
      return _i6.Quiz.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Answer?>()) {
      return (data != null ? _i2.Answer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Game?>()) {
      return (data != null ? _i3.Game.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Player?>()) {
      return (data != null ? _i4.Player.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Question?>()) {
      return (data != null ? _i5.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Quiz?>()) {
      return (data != null ? _i6.Quiz.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i4.Player>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i4.Player>(e)).toList()
          : null) as T;
    }
    if (t == List<_i2.Answer>) {
      return (data as List).map((e) => deserialize<_i2.Answer>(e)).toList()
          as T;
    }
    if (t == List<_i5.Question>) {
      return (data as List).map((e) => deserialize<_i5.Question>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i3.Game>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i3.Game>(e)).toList()
          : null) as T;
    }
    if (t == List<_i7.Quiz>) {
      return (data as List).map((e) => deserialize<_i7.Quiz>(e)).toList() as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Answer) {
      return 'Answer';
    }
    if (data is _i3.Game) {
      return 'Game';
    }
    if (data is _i4.Player) {
      return 'Player';
    }
    if (data is _i5.Question) {
      return 'Question';
    }
    if (data is _i6.Quiz) {
      return 'Quiz';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Answer') {
      return deserialize<_i2.Answer>(data['data']);
    }
    if (dataClassName == 'Game') {
      return deserialize<_i3.Game>(data['data']);
    }
    if (dataClassName == 'Player') {
      return deserialize<_i4.Player>(data['data']);
    }
    if (dataClassName == 'Question') {
      return deserialize<_i5.Question>(data['data']);
    }
    if (dataClassName == 'Quiz') {
      return deserialize<_i6.Quiz>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
