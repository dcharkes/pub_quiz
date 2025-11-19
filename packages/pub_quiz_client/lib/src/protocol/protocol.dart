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
import 'game_event.dart' as _i4;
import 'game_event_type.dart' as _i5;
import 'game_result.dart' as _i6;
import 'live_question.dart' as _i7;
import 'player.dart' as _i8;
import 'question.dart' as _i9;
import 'quiz.dart' as _i10;
import 'package:pub_quiz_client/src/protocol/quiz.dart' as _i11;
export 'answer.dart';
export 'game.dart';
export 'game_event.dart';
export 'game_event_type.dart';
export 'game_result.dart';
export 'live_question.dart';
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
    if (t == _i4.GameEvent) {
      return _i4.GameEvent.fromJson(data) as T;
    }
    if (t == _i5.GameEventType) {
      return _i5.GameEventType.fromJson(data) as T;
    }
    if (t == _i6.GameResult) {
      return _i6.GameResult.fromJson(data) as T;
    }
    if (t == _i7.LiveQuestion) {
      return _i7.LiveQuestion.fromJson(data) as T;
    }
    if (t == _i8.Player) {
      return _i8.Player.fromJson(data) as T;
    }
    if (t == _i9.Question) {
      return _i9.Question.fromJson(data) as T;
    }
    if (t == _i10.Quiz) {
      return _i10.Quiz.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Answer?>()) {
      return (data != null ? _i2.Answer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Game?>()) {
      return (data != null ? _i3.Game.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.GameEvent?>()) {
      return (data != null ? _i4.GameEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.GameEventType?>()) {
      return (data != null ? _i5.GameEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GameResult?>()) {
      return (data != null ? _i6.GameResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.LiveQuestion?>()) {
      return (data != null ? _i7.LiveQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Player?>()) {
      return (data != null ? _i8.Player.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Question?>()) {
      return (data != null ? _i9.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Quiz?>()) {
      return (data != null ? _i10.Quiz.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i8.Player>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Player>(e)).toList()
          : null) as T;
    }
    if (t == List<_i8.Player>) {
      return (data as List).map((e) => deserialize<_i8.Player>(e)).toList()
          as T;
    }
    if (t == List<_i2.Answer>) {
      return (data as List).map((e) => deserialize<_i2.Answer>(e)).toList()
          as T;
    }
    if (t == List<_i9.Question>) {
      return (data as List).map((e) => deserialize<_i9.Question>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i3.Game>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i3.Game>(e)).toList()
          : null) as T;
    }
    if (t == List<_i11.Quiz>) {
      return (data as List).map((e) => deserialize<_i11.Quiz>(e)).toList() as T;
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
    if (data is _i4.GameEvent) {
      return 'GameEvent';
    }
    if (data is _i5.GameEventType) {
      return 'GameEventType';
    }
    if (data is _i6.GameResult) {
      return 'GameResult';
    }
    if (data is _i7.LiveQuestion) {
      return 'LiveQuestion';
    }
    if (data is _i8.Player) {
      return 'Player';
    }
    if (data is _i9.Question) {
      return 'Question';
    }
    if (data is _i10.Quiz) {
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
    if (dataClassName == 'GameEvent') {
      return deserialize<_i4.GameEvent>(data['data']);
    }
    if (dataClassName == 'GameEventType') {
      return deserialize<_i5.GameEventType>(data['data']);
    }
    if (dataClassName == 'GameResult') {
      return deserialize<_i6.GameResult>(data['data']);
    }
    if (dataClassName == 'LiveQuestion') {
      return deserialize<_i7.LiveQuestion>(data['data']);
    }
    if (dataClassName == 'Player') {
      return deserialize<_i8.Player>(data['data']);
    }
    if (dataClassName == 'Question') {
      return deserialize<_i9.Question>(data['data']);
    }
    if (dataClassName == 'Quiz') {
      return deserialize<_i10.Quiz>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
