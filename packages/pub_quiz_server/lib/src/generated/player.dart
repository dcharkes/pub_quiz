/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'game.dart' as _i2;

/// A player in a game
abstract class Player implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = PlayerTable();

  static const db = PlayerRepository._();

  @override
  int? id;

  int gameId;

  _i2.Game? game;

  /// Player name, must not be unique.
  String name;

  /// Player score so far.
  int score;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'gameId': gameId,
      if (game != null) 'game': game?.toJsonForProtocol(),
      'name': name,
      'score': score,
    };
  }

  static PlayerInclude include({_i2.GameInclude? game}) {
    return PlayerInclude._(game: game);
  }

  static PlayerIncludeList includeList({
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    PlayerInclude? include,
  }) {
    return PlayerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Player.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Player.t),
      include: include,
    );
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

class PlayerTable extends _i1.Table<int?> {
  PlayerTable({super.tableRelation}) : super(tableName: 'player') {
    gameId = _i1.ColumnInt(
      'gameId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    score = _i1.ColumnInt(
      'score',
      this,
    );
  }

  late final _i1.ColumnInt gameId;

  _i2.GameTable? _game;

  /// Player name, must not be unique.
  late final _i1.ColumnString name;

  /// Player score so far.
  late final _i1.ColumnInt score;

  _i2.GameTable get game {
    if (_game != null) return _game!;
    _game = _i1.createRelationTable(
      relationFieldName: 'game',
      field: Player.t.gameId,
      foreignField: _i2.Game.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GameTable(tableRelation: foreignTableRelation),
    );
    return _game!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        gameId,
        name,
        score,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'game') {
      return game;
    }
    return null;
  }
}

class PlayerInclude extends _i1.IncludeObject {
  PlayerInclude._({_i2.GameInclude? game}) {
    _game = game;
  }

  _i2.GameInclude? _game;

  @override
  Map<String, _i1.Include?> get includes => {'game': _game};

  @override
  _i1.Table<int?> get table => Player.t;
}

class PlayerIncludeList extends _i1.IncludeList {
  PlayerIncludeList._({
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Player.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Player.t;
}

class PlayerRepository {
  const PlayerRepository._();

  final attachRow = const PlayerAttachRowRepository._();

  /// Returns a list of [Player]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Player>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.find<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Player] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Player?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? offset,
    _i1.OrderByBuilder<PlayerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PlayerTable>? orderByList,
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.findFirstRow<Player>(
      where: where?.call(Player.t),
      orderBy: orderBy?.call(Player.t),
      orderByList: orderByList?.call(Player.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Player] by its [id] or null if no such row exists.
  Future<Player?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PlayerInclude? include,
  }) async {
    return session.db.findById<Player>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Player]s in the list and returns the inserted rows.
  ///
  /// The returned [Player]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Player>> insert(
    _i1.Session session,
    List<Player> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Player>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Player] and returns the inserted row.
  ///
  /// The returned [Player] will have its `id` field set.
  Future<Player> insertRow(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Player>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Player]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Player>> update(
    _i1.Session session,
    List<Player> rows, {
    _i1.ColumnSelections<PlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Player>(
      rows,
      columns: columns?.call(Player.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Player]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Player> updateRow(
    _i1.Session session,
    Player row, {
    _i1.ColumnSelections<PlayerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Player>(
      row,
      columns: columns?.call(Player.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Player]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Player>> delete(
    _i1.Session session,
    List<Player> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Player>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Player].
  Future<Player> deleteRow(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Player>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Player>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PlayerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Player>(
      where: where(Player.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PlayerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Player>(
      where: where?.call(Player.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PlayerAttachRowRepository {
  const PlayerAttachRowRepository._();

  /// Creates a relation between the given [Player] and [Game]
  /// by setting the [Player]'s foreign key `gameId` to refer to the [Game].
  Future<void> game(
    _i1.Session session,
    Player player,
    _i2.Game game, {
    _i1.Transaction? transaction,
  }) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }

    var $player = player.copyWith(gameId: game.id);
    await session.db.updateRow<Player>(
      $player,
      columns: [Player.t.gameId],
      transaction: transaction,
    );
  }
}
