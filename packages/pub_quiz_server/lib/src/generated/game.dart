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
import 'quiz.dart' as _i2;
import 'player.dart' as _i3;

/// A game.
abstract class Game implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = GameTable();

  static const db = GameRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'quizId': quizId,
      if (quiz != null) 'quiz': quiz?.toJsonForProtocol(),
      'currentQuestion': currentQuestion,
      'questionStart': questionStart.toJson(),
      'deadline': deadline.toJson(),
      if (players != null)
        'players': players?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static GameInclude include({
    _i2.QuizInclude? quiz,
    _i3.PlayerIncludeList? players,
  }) {
    return GameInclude._(
      quiz: quiz,
      players: players,
    );
  }

  static GameIncludeList includeList({
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    GameInclude? include,
  }) {
    return GameIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Game.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Game.t),
      include: include,
    );
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

class GameTable extends _i1.Table<int?> {
  GameTable({super.tableRelation}) : super(tableName: 'game') {
    quizId = _i1.ColumnInt(
      'quizId',
      this,
    );
    currentQuestion = _i1.ColumnInt(
      'currentQuestion',
      this,
    );
    questionStart = _i1.ColumnDateTime(
      'questionStart',
      this,
    );
    deadline = _i1.ColumnDateTime(
      'deadline',
      this,
    );
  }

  late final _i1.ColumnInt quizId;

  /// Quiz this game belongs to.
  _i2.QuizTable? _quiz;

  /// Current question index. -1 if not started, quiz.questions.length if finished.
  late final _i1.ColumnInt currentQuestion;

  /// Question start time.
  late final _i1.ColumnDateTime questionStart;

  /// Deadline for the current question.
  late final _i1.ColumnDateTime deadline;

  /// The game participants.
  _i3.PlayerTable? ___players;

  /// The game participants.
  _i1.ManyRelation<_i3.PlayerTable>? _players;

  _i2.QuizTable get quiz {
    if (_quiz != null) return _quiz!;
    _quiz = _i1.createRelationTable(
      relationFieldName: 'quiz',
      field: Game.t.quizId,
      foreignField: _i2.Quiz.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuizTable(tableRelation: foreignTableRelation),
    );
    return _quiz!;
  }

  _i3.PlayerTable get __players {
    if (___players != null) return ___players!;
    ___players = _i1.createRelationTable(
      relationFieldName: '__players',
      field: Game.t.id,
      foreignField: _i3.Player.t.gameId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerTable(tableRelation: foreignTableRelation),
    );
    return ___players!;
  }

  _i1.ManyRelation<_i3.PlayerTable> get players {
    if (_players != null) return _players!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'players',
      field: Game.t.id,
      foreignField: _i3.Player.t.gameId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PlayerTable(tableRelation: foreignTableRelation),
    );
    _players = _i1.ManyRelation<_i3.PlayerTable>(
      tableWithRelations: relationTable,
      table: _i3.PlayerTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _players!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        quizId,
        currentQuestion,
        questionStart,
        deadline,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'quiz') {
      return quiz;
    }
    if (relationField == 'players') {
      return __players;
    }
    return null;
  }
}

class GameInclude extends _i1.IncludeObject {
  GameInclude._({
    _i2.QuizInclude? quiz,
    _i3.PlayerIncludeList? players,
  }) {
    _quiz = quiz;
    _players = players;
  }

  _i2.QuizInclude? _quiz;

  _i3.PlayerIncludeList? _players;

  @override
  Map<String, _i1.Include?> get includes => {
        'quiz': _quiz,
        'players': _players,
      };

  @override
  _i1.Table<int?> get table => Game.t;
}

class GameIncludeList extends _i1.IncludeList {
  GameIncludeList._({
    _i1.WhereExpressionBuilder<GameTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Game.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Game.t;
}

class GameRepository {
  const GameRepository._();

  final attach = const GameAttachRepository._();

  final attachRow = const GameAttachRowRepository._();

  final detach = const GameDetachRepository._();

  final detachRow = const GameDetachRowRepository._();

  /// Returns a list of [Game]s matching the given query parameters.
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
  Future<List<Game>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    _i1.Transaction? transaction,
    GameInclude? include,
  }) async {
    return session.db.find<Game>(
      where: where?.call(Game.t),
      orderBy: orderBy?.call(Game.t),
      orderByList: orderByList?.call(Game.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Game] matching the given query parameters.
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
  Future<Game?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameTable>? orderByList,
    _i1.Transaction? transaction,
    GameInclude? include,
  }) async {
    return session.db.findFirstRow<Game>(
      where: where?.call(Game.t),
      orderBy: orderBy?.call(Game.t),
      orderByList: orderByList?.call(Game.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Game] by its [id] or null if no such row exists.
  Future<Game?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GameInclude? include,
  }) async {
    return session.db.findById<Game>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Game]s in the list and returns the inserted rows.
  ///
  /// The returned [Game]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Game>> insert(
    _i1.Session session,
    List<Game> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Game>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Game] and returns the inserted row.
  ///
  /// The returned [Game] will have its `id` field set.
  Future<Game> insertRow(
    _i1.Session session,
    Game row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Game>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Game]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Game>> update(
    _i1.Session session,
    List<Game> rows, {
    _i1.ColumnSelections<GameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Game>(
      rows,
      columns: columns?.call(Game.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Game]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Game> updateRow(
    _i1.Session session,
    Game row, {
    _i1.ColumnSelections<GameTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Game>(
      row,
      columns: columns?.call(Game.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Game]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Game>> delete(
    _i1.Session session,
    List<Game> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Game>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Game].
  Future<Game> deleteRow(
    _i1.Session session,
    Game row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Game>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Game>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Game>(
      where: where(Game.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Game>(
      where: where?.call(Game.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GameAttachRepository {
  const GameAttachRepository._();

  /// Creates a relation between this [Game] and the given [Player]s
  /// by setting each [Player]'s foreign key `gameId` to refer to this [Game].
  Future<void> players(
    _i1.Session session,
    Game game,
    List<_i3.Player> player, {
    _i1.Transaction? transaction,
  }) async {
    if (player.any((e) => e.id == null)) {
      throw ArgumentError.notNull('player.id');
    }
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }

    var $player = player.map((e) => e.copyWith(gameId: game.id)).toList();
    await session.db.update<_i3.Player>(
      $player,
      columns: [_i3.Player.t.gameId],
      transaction: transaction,
    );
  }
}

class GameAttachRowRepository {
  const GameAttachRowRepository._();

  /// Creates a relation between the given [Game] and [Quiz]
  /// by setting the [Game]'s foreign key `quizId` to refer to the [Quiz].
  Future<void> quiz(
    _i1.Session session,
    Game game,
    _i2.Quiz quiz, {
    _i1.Transaction? transaction,
  }) async {
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $game = game.copyWith(quizId: quiz.id);
    await session.db.updateRow<Game>(
      $game,
      columns: [Game.t.quizId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Game] and the given [Player]
  /// by setting the [Player]'s foreign key `gameId` to refer to this [Game].
  Future<void> players(
    _i1.Session session,
    Game game,
    _i3.Player player, {
    _i1.Transaction? transaction,
  }) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }
    if (game.id == null) {
      throw ArgumentError.notNull('game.id');
    }

    var $player = player.copyWith(gameId: game.id);
    await session.db.updateRow<_i3.Player>(
      $player,
      columns: [_i3.Player.t.gameId],
      transaction: transaction,
    );
  }
}

class GameDetachRepository {
  const GameDetachRepository._();

  /// Detaches the relation between this [Game] and the given [Player]
  /// by setting the [Player]'s foreign key `gameId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> players(
    _i1.Session session,
    List<_i3.Player> player, {
    _i1.Transaction? transaction,
  }) async {
    if (player.any((e) => e.id == null)) {
      throw ArgumentError.notNull('player.id');
    }

    var $player = player.map((e) => e.copyWith(gameId: null)).toList();
    await session.db.update<_i3.Player>(
      $player,
      columns: [_i3.Player.t.gameId],
      transaction: transaction,
    );
  }
}

class GameDetachRowRepository {
  const GameDetachRowRepository._();

  /// Detaches the relation between this [Game] and the given [Player]
  /// by setting the [Player]'s foreign key `gameId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> players(
    _i1.Session session,
    _i3.Player player, {
    _i1.Transaction? transaction,
  }) async {
    if (player.id == null) {
      throw ArgumentError.notNull('player.id');
    }

    var $player = player.copyWith(gameId: null);
    await session.db.updateRow<_i3.Player>(
      $player,
      columns: [_i3.Player.t.gameId],
      transaction: transaction,
    );
  }
}
