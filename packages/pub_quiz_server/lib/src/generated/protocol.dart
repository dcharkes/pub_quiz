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
import 'package:serverpod/protocol.dart' as _i2;
import 'answer.dart' as _i3;
import 'game.dart' as _i4;
import 'game_event.dart' as _i5;
import 'game_event_type.dart' as _i6;
import 'game_result.dart' as _i7;
import 'live_question.dart' as _i8;
import 'player.dart' as _i9;
import 'question.dart' as _i10;
import 'quiz.dart' as _i11;
import 'package:pub_quiz_server/src/generated/quiz.dart' as _i12;
export 'answer.dart';
export 'game.dart';
export 'game_event.dart';
export 'game_event_type.dart';
export 'game_result.dart';
export 'live_question.dart';
export 'player.dart';
export 'question.dart';
export 'quiz.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'game',
      dartName: 'Game',
      schema: 'public',
      module: 'pub_quiz',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'game_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'quizId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'currentQuestion',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'questionStart',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'deadline',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'game_fk_0',
          columns: ['quizId'],
          referenceTable: 'quiz',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'game_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'player',
      dartName: 'Player',
      schema: 'public',
      module: 'pub_quiz',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'player_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'gameId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'score',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'player_fk_0',
          columns: ['gameId'],
          referenceTable: 'game',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'player_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'quiz',
      dartName: 'Quiz',
      schema: 'public',
      module: 'pub_quiz',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'quiz_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'questions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:Question>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'quiz_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Answer) {
      return _i3.Answer.fromJson(data) as T;
    }
    if (t == _i4.Game) {
      return _i4.Game.fromJson(data) as T;
    }
    if (t == _i5.GameEvent) {
      return _i5.GameEvent.fromJson(data) as T;
    }
    if (t == _i6.GameEventType) {
      return _i6.GameEventType.fromJson(data) as T;
    }
    if (t == _i7.GameResult) {
      return _i7.GameResult.fromJson(data) as T;
    }
    if (t == _i8.LiveQuestion) {
      return _i8.LiveQuestion.fromJson(data) as T;
    }
    if (t == _i9.Player) {
      return _i9.Player.fromJson(data) as T;
    }
    if (t == _i10.Question) {
      return _i10.Question.fromJson(data) as T;
    }
    if (t == _i11.Quiz) {
      return _i11.Quiz.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Answer?>()) {
      return (data != null ? _i3.Answer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Game?>()) {
      return (data != null ? _i4.Game.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.GameEvent?>()) {
      return (data != null ? _i5.GameEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GameEventType?>()) {
      return (data != null ? _i6.GameEventType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GameResult?>()) {
      return (data != null ? _i7.GameResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.LiveQuestion?>()) {
      return (data != null ? _i8.LiveQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Player?>()) {
      return (data != null ? _i9.Player.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Question?>()) {
      return (data != null ? _i10.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Quiz?>()) {
      return (data != null ? _i11.Quiz.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i9.Player>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i9.Player>(e)).toList()
          : null) as T;
    }
    if (t == List<_i9.Player>) {
      return (data as List).map((e) => deserialize<_i9.Player>(e)).toList()
          as T;
    }
    if (t == List<_i3.Answer>) {
      return (data as List).map((e) => deserialize<_i3.Answer>(e)).toList()
          as T;
    }
    if (t == List<_i10.Question>) {
      return (data as List).map((e) => deserialize<_i10.Question>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.Game>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i4.Game>(e)).toList()
          : null) as T;
    }
    if (t == List<_i12.Quiz>) {
      return (data as List).map((e) => deserialize<_i12.Quiz>(e)).toList() as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i3.Answer) {
      return 'Answer';
    }
    if (data is _i4.Game) {
      return 'Game';
    }
    if (data is _i5.GameEvent) {
      return 'GameEvent';
    }
    if (data is _i6.GameEventType) {
      return 'GameEventType';
    }
    if (data is _i7.GameResult) {
      return 'GameResult';
    }
    if (data is _i8.LiveQuestion) {
      return 'LiveQuestion';
    }
    if (data is _i9.Player) {
      return 'Player';
    }
    if (data is _i10.Question) {
      return 'Question';
    }
    if (data is _i11.Quiz) {
      return 'Quiz';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
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
      return deserialize<_i3.Answer>(data['data']);
    }
    if (dataClassName == 'Game') {
      return deserialize<_i4.Game>(data['data']);
    }
    if (dataClassName == 'GameEvent') {
      return deserialize<_i5.GameEvent>(data['data']);
    }
    if (dataClassName == 'GameEventType') {
      return deserialize<_i6.GameEventType>(data['data']);
    }
    if (dataClassName == 'GameResult') {
      return deserialize<_i7.GameResult>(data['data']);
    }
    if (dataClassName == 'LiveQuestion') {
      return deserialize<_i8.LiveQuestion>(data['data']);
    }
    if (dataClassName == 'Player') {
      return deserialize<_i9.Player>(data['data']);
    }
    if (dataClassName == 'Question') {
      return deserialize<_i10.Question>(data['data']);
    }
    if (dataClassName == 'Quiz') {
      return deserialize<_i11.Quiz>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Game:
        return _i4.Game.t;
      case _i9.Player:
        return _i9.Player.t;
      case _i11.Quiz:
        return _i11.Quiz.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'pub_quiz';
}
