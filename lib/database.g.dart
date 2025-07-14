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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
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
  final String name;
  const TodolistData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TodolistCompanion toCompanion(bool nullToAbsent) {
    return TodolistCompanion(id: Value(id), name: Value(name));
  }

  factory TodolistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodolistData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  TodolistData copyWith({int? id, String? name}) =>
      TodolistData(id: id ?? this.id, name: name ?? this.name);
  TodolistData copyWithCompanion(TodolistCompanion data) {
    return TodolistData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodolistData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodolistData && other.id == this.id && other.name == this.name);
}

class TodolistCompanion extends UpdateCompanion<TodolistData> {
  final Value<int> id;
  final Value<String> name;
  const TodolistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TodolistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<TodolistData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TodolistCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TodolistCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodolistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class Tasks extends Table with TableInfo<Tasks, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tasks(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  late final GeneratedColumn<int> listId = GeneratedColumn<int>(
    'list_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL REFERENCES todolist(id)',
  );
  @override
  List<GeneratedColumn> get $columns => [id, task, done, listId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
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
    if (data.containsKey('list_id')) {
      context.handle(
        _listIdMeta,
        listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta),
      );
    } else if (isInserting) {
      context.missing(_listIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
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
      listId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}list_id'],
      )!,
    );
  }

  @override
  Tasks createAlias(String alias) {
    return Tasks(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String task;
  final bool done;
  final int listId;
  const Task({
    required this.id,
    required this.task,
    required this.done,
    required this.listId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task'] = Variable<String>(task);
    map['done'] = Variable<bool>(done);
    map['list_id'] = Variable<int>(listId);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      task: Value(task),
      done: Value(done),
      listId: Value(listId),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      task: serializer.fromJson<String>(json['task']),
      done: serializer.fromJson<bool>(json['done']),
      listId: serializer.fromJson<int>(json['list_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'task': serializer.toJson<String>(task),
      'done': serializer.toJson<bool>(done),
      'list_id': serializer.toJson<int>(listId),
    };
  }

  Task copyWith({int? id, String? task, bool? done, int? listId}) => Task(
    id: id ?? this.id,
    task: task ?? this.task,
    done: done ?? this.done,
    listId: listId ?? this.listId,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      task: data.task.present ? data.task.value : this.task,
      done: data.done.present ? data.done.value : this.done,
      listId: data.listId.present ? data.listId.value : this.listId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('done: $done, ')
          ..write('listId: $listId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, task, done, listId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.task == this.task &&
          other.done == this.done &&
          other.listId == this.listId);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> task;
  final Value<bool> done;
  final Value<int> listId;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.done = const Value.absent(),
    this.listId = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String task,
    this.done = const Value.absent(),
    required int listId,
  }) : task = Value(task),
       listId = Value(listId);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? task,
    Expression<bool>? done,
    Expression<int>? listId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (task != null) 'task': task,
      if (done != null) 'done': done,
      if (listId != null) 'list_id': listId,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? task,
    Value<bool>? done,
    Value<int>? listId,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      task: task ?? this.task,
      done: done ?? this.done,
      listId: listId ?? this.listId,
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
    if (listId.present) {
      map['list_id'] = Variable<int>(listId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('done: $done, ')
          ..write('listId: $listId')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final Todolist todolist = Todolist(this);
  late final Tasks tasks = Tasks(this);
  Future<int> changeTask(String var1, int var2) {
    return customUpdate(
      'UPDATE tasks SET task = ?1 WHERE id = ?2',
      variables: [Variable<String>(var1), Variable<int>(var2)],
      updates: {tasks},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<String> getTaskName(int var1) {
    return customSelect(
      'SELECT task FROM tasks WHERE id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {tasks},
    ).map((QueryRow row) => row.read<String>('task'));
  }

  Selectable<Task> getAllTasks(int var1) {
    return customSelect(
      'SELECT * FROM tasks WHERE list_id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getTask(int var1) {
    return customSelect(
      'SELECT * FROM tasks WHERE id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getDoneTasks() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = TRUE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Future<int> updateTask(bool var1, int var2) {
    return customUpdate(
      'UPDATE tasks SET done = ?1 WHERE id = ?2',
      variables: [Variable<bool>(var1), Variable<int>(var2)],
      updates: {tasks},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Task> getUndoneTasks() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = FALSE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Future<int> deleteTask(int var1) {
    return customUpdate(
      'DELETE FROM tasks WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {tasks},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> createTask(String var1, bool var2, int var3) {
    return customInsert(
      'INSERT INTO tasks (task, done, list_id) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<String>(var1),
        Variable<bool>(var2),
        Variable<int>(var3),
      ],
      updates: {tasks},
    );
  }

  Selectable<Task> getDoneTrueFirst() {
    return customSelect(
      'SELECT * FROM tasks ORDER BY done DESC',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getDoneFalseFirst() {
    return customSelect(
      'SELECT * FROM tasks ORDER BY done ASC',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getOnlyDoneTrue() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = TRUE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getOnlyDoneFalse() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = FALSE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Future<int> createList(String var1) {
    return customInsert(
      'INSERT INTO todolist (name) VALUES (?1)',
      variables: [Variable<String>(var1)],
      updates: {todolist},
    );
  }

  Selectable<TodolistData> getAllLists() {
    return customSelect(
      'SELECT * FROM todolist',
      variables: [],
      readsFrom: {todolist},
    ).asyncMap(todolist.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todolist, tasks];
}

typedef $TodolistCreateCompanionBuilder =
    TodolistCompanion Function({Value<int> id, required String name});
typedef $TodolistUpdateCompanionBuilder =
    TodolistCompanion Function({Value<int> id, Value<String> name});

final class $TodolistReferences
    extends BaseReferences<_$Database, Todolist, TodolistData> {
  $TodolistReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<Tasks, List<Task>> _tasksRefsTable(
    _$Database db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.todolist.id, db.tasks.listId),
  );

  $TasksProcessedTableManager get tasksRefs {
    final manager = $TasksTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.listId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> tasksRefs(
    Expression<bool> Function($TasksFilterComposer f) f,
  ) {
    final $TasksFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.listId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TasksFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($TasksAnnotationComposer a) f,
  ) {
    final $TasksAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.listId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TasksAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (TodolistData, $TodolistReferences),
          TodolistData,
          PrefetchHooks Function({bool tasksRefs})
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
                Value<String> name = const Value.absent(),
              }) => TodolistCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  TodolistCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $TodolistReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({tasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tasksRefs) db.tasks],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksRefs)
                    await $_getPrefetchedData<TodolistData, Todolist, Task>(
                      currentTable: table,
                      referencedTable: $TodolistReferences._tasksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $TodolistReferences(db, table, p0).tasksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.listId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (TodolistData, $TodolistReferences),
      TodolistData,
      PrefetchHooks Function({bool tasksRefs})
    >;
typedef $TasksCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required String task,
      Value<bool> done,
      required int listId,
    });
typedef $TasksUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> task,
      Value<bool> done,
      Value<int> listId,
    });

final class $TasksReferences extends BaseReferences<_$Database, Tasks, Task> {
  $TasksReferences(super.$_db, super.$_table, super.$_typedResult);

  static Todolist _listIdTable(_$Database db) => db.todolist.createAlias(
    $_aliasNameGenerator(db.tasks.listId, db.todolist.id),
  );

  $TodolistProcessedTableManager get listId {
    final $_column = $_itemColumn<int>('list_id')!;

    final manager = $TodolistTableManager(
      $_db,
      $_db.todolist,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_listIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $TasksFilterComposer extends Composer<_$Database, Tasks> {
  $TasksFilterComposer({
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

  $TodolistFilterComposer get listId {
    final $TodolistFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.todolist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TodolistFilterComposer(
            $db: $db,
            $table: $db.todolist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TasksOrderingComposer extends Composer<_$Database, Tasks> {
  $TasksOrderingComposer({
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

  $TodolistOrderingComposer get listId {
    final $TodolistOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.todolist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TodolistOrderingComposer(
            $db: $db,
            $table: $db.todolist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TasksAnnotationComposer extends Composer<_$Database, Tasks> {
  $TasksAnnotationComposer({
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

  $TodolistAnnotationComposer get listId {
    final $TodolistAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.listId,
      referencedTable: $db.todolist,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $TodolistAnnotationComposer(
            $db: $db,
            $table: $db.todolist,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $TasksTableManager
    extends
        RootTableManager<
          _$Database,
          Tasks,
          Task,
          $TasksFilterComposer,
          $TasksOrderingComposer,
          $TasksAnnotationComposer,
          $TasksCreateCompanionBuilder,
          $TasksUpdateCompanionBuilder,
          (Task, $TasksReferences),
          Task,
          PrefetchHooks Function({bool listId})
        > {
  $TasksTableManager(_$Database db, Tasks table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $TasksFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $TasksOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $TasksAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> task = const Value.absent(),
                Value<bool> done = const Value.absent(),
                Value<int> listId = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                task: task,
                done: done,
                listId: listId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String task,
                Value<bool> done = const Value.absent(),
                required int listId,
              }) => TasksCompanion.insert(
                id: id,
                task: task,
                done: done,
                listId: listId,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), $TasksReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({listId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (listId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.listId,
                                referencedTable: $TasksReferences._listIdTable(
                                  db,
                                ),
                                referencedColumn: $TasksReferences
                                    ._listIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $TasksProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      Tasks,
      Task,
      $TasksFilterComposer,
      $TasksOrderingComposer,
      $TasksAnnotationComposer,
      $TasksCreateCompanionBuilder,
      $TasksUpdateCompanionBuilder,
      (Task, $TasksReferences),
      Task,
      PrefetchHooks Function({bool listId})
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $TodolistTableManager get todolist =>
      $TodolistTableManager(_db, _db.todolist);
  $TasksTableManager get tasks => $TasksTableManager(_db, _db.tasks);
}
