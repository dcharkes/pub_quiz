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
import 'question.dart' as _i2;

/// A quiz.
abstract class Quiz implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Quiz._({
    this.id,
    required this.title,
    this.questions,
  });

  factory Quiz({
    int? id,
    required String title,
    List<_i2.Question>? questions,
  }) = _QuizImpl;

  factory Quiz.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quiz(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      questions: (jsonSerialization['questions'] as List?)
          ?.map((e) => _i2.Question.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = QuizTable();

  static const db = QuizRepository._();

  @override
  int? id;

  /// The title of the quiz.
  String title;

  /// The questions in this quiz.
  List<_i2.Question>? questions;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Quiz copyWith({
    int? id,
    String? title,
    List<_i2.Question>? questions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (questions != null)
        'questions': questions?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (questions != null)
        'questions':
            questions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static QuizInclude include({_i2.QuestionIncludeList? questions}) {
    return QuizInclude._(questions: questions);
  }

  static QuizIncludeList includeList({
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    QuizInclude? include,
  }) {
    return QuizIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Quiz.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Quiz.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    required String title,
    List<_i2.Question>? questions,
  }) : super._(
          id: id,
          title: title,
          questions: questions,
        );

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Quiz copyWith({
    Object? id = _Undefined,
    String? title,
    Object? questions = _Undefined,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      questions: questions is List<_i2.Question>?
          ? questions
          : this.questions?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class QuizTable extends _i1.Table<int?> {
  QuizTable({super.tableRelation}) : super(tableName: 'quiz') {
    title = _i1.ColumnString(
      'title',
      this,
    );
  }

  /// The title of the quiz.
  late final _i1.ColumnString title;

  /// The questions in this quiz.
  _i2.QuestionTable? ___questions;

  /// The questions in this quiz.
  _i1.ManyRelation<_i2.QuestionTable>? _questions;

  _i2.QuestionTable get __questions {
    if (___questions != null) return ___questions!;
    ___questions = _i1.createRelationTable(
      relationFieldName: '__questions',
      field: Quiz.t.id,
      foreignField: _i2.Question.t.quizId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    return ___questions!;
  }

  _i1.ManyRelation<_i2.QuestionTable> get questions {
    if (_questions != null) return _questions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'questions',
      field: Quiz.t.id,
      foreignField: _i2.Question.t.quizId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    _questions = _i1.ManyRelation<_i2.QuestionTable>(
      tableWithRelations: relationTable,
      table: _i2.QuestionTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _questions!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        title,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'questions') {
      return __questions;
    }
    return null;
  }
}

class QuizInclude extends _i1.IncludeObject {
  QuizInclude._({_i2.QuestionIncludeList? questions}) {
    _questions = questions;
  }

  _i2.QuestionIncludeList? _questions;

  @override
  Map<String, _i1.Include?> get includes => {'questions': _questions};

  @override
  _i1.Table<int?> get table => Quiz.t;
}

class QuizIncludeList extends _i1.IncludeList {
  QuizIncludeList._({
    _i1.WhereExpressionBuilder<QuizTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Quiz.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Quiz.t;
}

class QuizRepository {
  const QuizRepository._();

  final attach = const QuizAttachRepository._();

  final attachRow = const QuizAttachRowRepository._();

  /// Returns a list of [Quiz]s matching the given query parameters.
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
  Future<List<Quiz>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.find<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Quiz] matching the given query parameters.
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
  Future<Quiz?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuizTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizTable>? orderByList,
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.findFirstRow<Quiz>(
      where: where?.call(Quiz.t),
      orderBy: orderBy?.call(Quiz.t),
      orderByList: orderByList?.call(Quiz.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Quiz] by its [id] or null if no such row exists.
  Future<Quiz?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuizInclude? include,
  }) async {
    return session.db.findById<Quiz>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Quiz]s in the list and returns the inserted rows.
  ///
  /// The returned [Quiz]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Quiz>> insert(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Quiz>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Quiz] and returns the inserted row.
  ///
  /// The returned [Quiz] will have its `id` field set.
  Future<Quiz> insertRow(
    _i1.Session session,
    Quiz row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Quiz>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Quiz]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Quiz>> update(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.ColumnSelections<QuizTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Quiz>(
      rows,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Quiz]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Quiz> updateRow(
    _i1.Session session,
    Quiz row, {
    _i1.ColumnSelections<QuizTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Quiz>(
      row,
      columns: columns?.call(Quiz.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Quiz]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Quiz>> delete(
    _i1.Session session,
    List<Quiz> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Quiz>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Quiz].
  Future<Quiz> deleteRow(
    _i1.Session session,
    Quiz row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Quiz>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Quiz>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuizTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Quiz>(
      where: where(Quiz.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuizTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Quiz>(
      where: where?.call(Quiz.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuizAttachRepository {
  const QuizAttachRepository._();

  /// Creates a relation between this [Quiz] and the given [Question]s
  /// by setting each [Question]'s foreign key `quizId` to refer to this [Quiz].
  Future<void> questions(
    _i1.Session session,
    Quiz quiz,
    List<_i2.Question> question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.any((e) => e.id == null)) {
      throw ArgumentError.notNull('question.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $question = question.map((e) => e.copyWith(quizId: quiz.id)).toList();
    await session.db.update<_i2.Question>(
      $question,
      columns: [_i2.Question.t.quizId],
      transaction: transaction,
    );
  }
}

class QuizAttachRowRepository {
  const QuizAttachRowRepository._();

  /// Creates a relation between this [Quiz] and the given [Question]
  /// by setting the [Question]'s foreign key `quizId` to refer to this [Quiz].
  Future<void> questions(
    _i1.Session session,
    Quiz quiz,
    _i2.Question question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }
    if (quiz.id == null) {
      throw ArgumentError.notNull('quiz.id');
    }

    var $question = question.copyWith(quizId: quiz.id);
    await session.db.updateRow<_i2.Question>(
      $question,
      columns: [_i2.Question.t.quizId],
      transaction: transaction,
    );
  }
}
