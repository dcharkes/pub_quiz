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

/// An answer to a question.
abstract class Answer implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Answer._({
    this.id,
    required this.questionId,
    this.question,
    required this.text,
    required this.correct,
  });

  factory Answer({
    int? id,
    required int questionId,
    _i2.Question? question,
    required String text,
    required bool correct,
  }) = _AnswerImpl;

  factory Answer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Answer(
      id: jsonSerialization['id'] as int?,
      questionId: jsonSerialization['questionId'] as int,
      question: jsonSerialization['question'] == null
          ? null
          : _i2.Question.fromJson(
              (jsonSerialization['question'] as Map<String, dynamic>)),
      text: jsonSerialization['text'] as String,
      correct: jsonSerialization['correct'] as bool,
    );
  }

  static final t = AnswerTable();

  static const db = AnswerRepository._();

  @override
  int? id;

  int questionId;

  _i2.Question? question;

  /// The text representation of this answer.
  String text;

  /// Whether this answer is correct.
  bool correct;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Answer copyWith({
    int? id,
    int? questionId,
    _i2.Question? question,
    String? text,
    bool? correct,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'questionId': questionId,
      if (question != null) 'question': question?.toJson(),
      'text': text,
      'correct': correct,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'questionId': questionId,
      if (question != null) 'question': question?.toJsonForProtocol(),
      'text': text,
      'correct': correct,
    };
  }

  static AnswerInclude include({_i2.QuestionInclude? question}) {
    return AnswerInclude._(question: question);
  }

  static AnswerIncludeList includeList({
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerTable>? orderByList,
    AnswerInclude? include,
  }) {
    return AnswerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Answer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Answer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AnswerImpl extends Answer {
  _AnswerImpl({
    int? id,
    required int questionId,
    _i2.Question? question,
    required String text,
    required bool correct,
  }) : super._(
          id: id,
          questionId: questionId,
          question: question,
          text: text,
          correct: correct,
        );

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Answer copyWith({
    Object? id = _Undefined,
    int? questionId,
    Object? question = _Undefined,
    String? text,
    bool? correct,
  }) {
    return Answer(
      id: id is int? ? id : this.id,
      questionId: questionId ?? this.questionId,
      question:
          question is _i2.Question? ? question : this.question?.copyWith(),
      text: text ?? this.text,
      correct: correct ?? this.correct,
    );
  }
}

class AnswerTable extends _i1.Table<int?> {
  AnswerTable({super.tableRelation}) : super(tableName: 'answer') {
    questionId = _i1.ColumnInt(
      'questionId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    correct = _i1.ColumnBool(
      'correct',
      this,
    );
  }

  late final _i1.ColumnInt questionId;

  _i2.QuestionTable? _question;

  /// The text representation of this answer.
  late final _i1.ColumnString text;

  /// Whether this answer is correct.
  late final _i1.ColumnBool correct;

  _i2.QuestionTable get question {
    if (_question != null) return _question!;
    _question = _i1.createRelationTable(
      relationFieldName: 'question',
      field: Answer.t.questionId,
      foreignField: _i2.Question.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    return _question!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        questionId,
        text,
        correct,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'question') {
      return question;
    }
    return null;
  }
}

class AnswerInclude extends _i1.IncludeObject {
  AnswerInclude._({_i2.QuestionInclude? question}) {
    _question = question;
  }

  _i2.QuestionInclude? _question;

  @override
  Map<String, _i1.Include?> get includes => {'question': _question};

  @override
  _i1.Table<int?> get table => Answer.t;
}

class AnswerIncludeList extends _i1.IncludeList {
  AnswerIncludeList._({
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Answer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Answer.t;
}

class AnswerRepository {
  const AnswerRepository._();

  final attachRow = const AnswerAttachRowRepository._();

  /// Returns a list of [Answer]s matching the given query parameters.
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
  Future<List<Answer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerTable>? orderByList,
    _i1.Transaction? transaction,
    AnswerInclude? include,
  }) async {
    return session.db.find<Answer>(
      where: where?.call(Answer.t),
      orderBy: orderBy?.call(Answer.t),
      orderByList: orderByList?.call(Answer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Answer] matching the given query parameters.
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
  Future<Answer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? offset,
    _i1.OrderByBuilder<AnswerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerTable>? orderByList,
    _i1.Transaction? transaction,
    AnswerInclude? include,
  }) async {
    return session.db.findFirstRow<Answer>(
      where: where?.call(Answer.t),
      orderBy: orderBy?.call(Answer.t),
      orderByList: orderByList?.call(Answer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Answer] by its [id] or null if no such row exists.
  Future<Answer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AnswerInclude? include,
  }) async {
    return session.db.findById<Answer>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Answer]s in the list and returns the inserted rows.
  ///
  /// The returned [Answer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Answer>> insert(
    _i1.Session session,
    List<Answer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Answer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Answer] and returns the inserted row.
  ///
  /// The returned [Answer] will have its `id` field set.
  Future<Answer> insertRow(
    _i1.Session session,
    Answer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Answer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Answer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Answer>> update(
    _i1.Session session,
    List<Answer> rows, {
    _i1.ColumnSelections<AnswerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Answer>(
      rows,
      columns: columns?.call(Answer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Answer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Answer> updateRow(
    _i1.Session session,
    Answer row, {
    _i1.ColumnSelections<AnswerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Answer>(
      row,
      columns: columns?.call(Answer.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Answer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Answer>> delete(
    _i1.Session session,
    List<Answer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Answer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Answer].
  Future<Answer> deleteRow(
    _i1.Session session,
    Answer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Answer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Answer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AnswerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Answer>(
      where: where(Answer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Answer>(
      where: where?.call(Answer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AnswerAttachRowRepository {
  const AnswerAttachRowRepository._();

  /// Creates a relation between the given [Answer] and [Question]
  /// by setting the [Answer]'s foreign key `questionId` to refer to the [Question].
  Future<void> question(
    _i1.Session session,
    Answer answer,
    _i2.Question question, {
    _i1.Transaction? transaction,
  }) async {
    if (answer.id == null) {
      throw ArgumentError.notNull('answer.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $answer = answer.copyWith(questionId: question.id);
    await session.db.updateRow<Answer>(
      $answer,
      columns: [Answer.t.questionId],
      transaction: transaction,
    );
  }
}
