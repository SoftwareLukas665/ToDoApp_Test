// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Todolist extends Table with TableInfo<Todolist, TodolistData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Todolist(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
    'task',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, task, done];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todolist';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodolistData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
        _taskMeta,
        task.isAcceptableOrUnknown(data['task']!, _taskMeta),
      );
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
        _doneMeta,
        done.isAcceptableOrUnknown(data['done']!, _doneMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodolistData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodolistData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      task: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task'],
      )!,
      done: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}done'],
      )!,
    );
  }

  @override
  Todolist createAlias(String alias) {
    return Todolist(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class TodolistData extends DataClass implements Insertable<TodolistData> {
  final int id;
  final String task;
  final bool done;
  const TodolistData({
    required this.id,
    required this.task,
    required this.done,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task'] = Variable<String>(task);
    map['done'] = Variable<bool>(done);
    return map;
  }

  TodolistCompanion toCompanion(bool nullToAbsent) {
    return TodolistCompanion(
      id: Value(id),
      task: Value(task),
      done: Value(done),
    );
  }

  factory TodolistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodolistData(
      id: serializer.fromJson<int>(json['id']),
      task: serializer.fromJson<String>(json['task']),
      done: serializer.fromJson<bool>(json['done']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'task': serializer.toJson<String>(task),
      'done': serializer.toJson<bool>(done),
    };
  }

  TodolistData copyWith({int? id, String? task, bool? done}) => TodolistData(
    id: id ?? this.id,
    task: task ?? this.task,
    done: done ?? this.done,
  );
  TodolistData copyWithCompanion(TodolistCompanion data) {
    return TodolistData(
      id: data.id.present ? data.id.value : this.id,
      task: data.task.present ? data.task.value : this.task,
      done: data.done.present ? data.done.value : this.done,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodolistData(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('done: $done')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, task, done);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodolistData &&
          other.id == this.id &&
          other.task == this.task &&
          other.done == this.done);
}

class TodolistCompanion extends UpdateCompanion<TodolistData> {
  final Value<int> id;
  final Value<String> task;
  final Value<bool> done;
  const TodolistCompanion({
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.done = const Value.absent(),
  });
  TodolistCompanion.insert({
    this.id = const Value.absent(),
    required String task,
    this.done = const Value.absent(),
  }) : task = Value(task);
  static Insertable<TodolistData> custom({
    Expression<int>? id,
    Expression<String>? task,
    Expression<bool>? done,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (task != null) 'task': task,
      if (done != null) 'done': done,
    });
  }

  TodolistCompanion copyWith({
    Value<int>? id,
    Value<String>? task,
    Value<bool>? done,
  }) {
    return TodolistCompanion(
      id: id ?? this.id,
      task: task ?? this.task,
      done: done ?? this.done,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodolistCompanion(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('done: $done')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final Todolist todolist = Todolist(this);
  Selectable<TodolistData> getAllTasks() {
    return customSelect(
      'SELECT * FROM todolist',
      variables: [],
      readsFrom: {todolist},
    ).asyncMap(todolist.mapFromRow);
  }

  Selectable<TodolistData> getTask(int var1) {
    return customSelect(
      'SELECT * FROM todolist WHERE id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {todolist},
    ).asyncMap(todolist.mapFromRow);
  }

  Selectable<TodolistData> getDoneTasks() {
    return customSelect(
      'SELECT * FROM todolist WHERE done = TRUE',
      variables: [],
      readsFrom: {todolist},
    ).asyncMap(todolist.mapFromRow);
  }

  Future<int> updateTask(bool var1, int var2) {
    return customUpdate(
      'UPDATE todolist SET done = ?1 WHERE id = ?2',
      variables: [Variable<bool>(var1), Variable<int>(var2)],
      updates: {todolist},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<TodolistData> getUndoneTasks() {
    return customSelect(
      'SELECT * FROM todolist WHERE done = FALSE',
      variables: [],
      readsFrom: {todolist},
    ).asyncMap(todolist.mapFromRow);
  }

  Future<int> deleteTask(int var1) {
    return customUpdate(
      'DELETE FROM todolist WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {todolist},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> createTask(String var1, bool var2) {
    return customInsert(
      'INSERT INTO todolist (task, done) VALUES (?1, ?2)',
      variables: [Variable<String>(var1), Variable<bool>(var2)],
      updates: {todolist},
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todolist];
}

typedef $TodolistCreateCompanionBuilder =
    TodolistCompanion Function({
      Value<int> id,
      required String task,
      Value<bool> done,
    });
typedef $TodolistUpdateCompanionBuilder =
    TodolistCompanion Function({
      Value<int> id,
      Value<String> task,
      Value<bool> done,
    });

class $TodolistFilterComposer extends Composer<_$Database, Todolist> {
  $TodolistFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get task => $composableBuilder(
    column: $table.task,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnFilters(column),
  );
}

class $TodolistOrderingComposer extends Composer<_$Database, Todolist> {
  $TodolistOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get task => $composableBuilder(
    column: $table.task,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnOrderings(column),
  );
}

class $TodolistAnnotationComposer extends Composer<_$Database, Todolist> {
  $TodolistAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get task =>
      $composableBuilder(column: $table.task, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);
}

class $TodolistTableManager
    extends
        RootTableManager<
          _$Database,
          Todolist,
          TodolistData,
          $TodolistFilterComposer,
          $TodolistOrderingComposer,
          $TodolistAnnotationComposer,
          $TodolistCreateCompanionBuilder,
          $TodolistUpdateCompanionBuilder,
          (TodolistData, BaseReferences<_$Database, Todolist, TodolistData>),
          TodolistData,
          PrefetchHooks Function()
        > {
  $TodolistTableManager(_$Database db, Todolist table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TodolistFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TodolistOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TodolistAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> task = const Value.absent(),
                Value<bool> done = const Value.absent(),
              }) => TodolistCompanion(id: id, task: task, done: done),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String task,
                Value<bool> done = const Value.absent(),
              }) => TodolistCompanion.insert(id: id, task: task, done: done),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $TodolistProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      Todolist,
      TodolistData,
      $TodolistFilterComposer,
      $TodolistOrderingComposer,
      $TodolistAnnotationComposer,
      $TodolistCreateCompanionBuilder,
      $TodolistUpdateCompanionBuilder,
      (TodolistData, BaseReferences<_$Database, Todolist, TodolistData>),
      TodolistData,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $TodolistTableManager get todolist =>
      $TodolistTableManager(_db, _db.todolist);
}
