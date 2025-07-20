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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<double> createdAt = GeneratedColumn<double>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<double> updatedAt = GeneratedColumn<double>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    updatedAt,
    deleted,
  ];
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
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
  final double createdAt;
  final double updatedAt;
  final bool deleted;
  const TodolistData({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<double>(createdAt);
    map['updated_at'] = Variable<double>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  TodolistCompanion toCompanion(bool nullToAbsent) {
    return TodolistCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
    );
  }

  factory TodolistData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodolistData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<double>(json['created_at']),
      updatedAt: serializer.fromJson<double>(json['updated_at']),
      deleted: serializer.fromJson<bool>(json['deleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'created_at': serializer.toJson<double>(createdAt),
      'updated_at': serializer.toJson<double>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  TodolistData copyWith({
    int? id,
    String? name,
    double? createdAt,
    double? updatedAt,
    bool? deleted,
  }) => TodolistData(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
  );
  TodolistData copyWithCompanion(TodolistCompanion data) {
    return TodolistData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodolistData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodolistData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class TodolistCompanion extends UpdateCompanion<TodolistData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> createdAt;
  final Value<double> updatedAt;
  final Value<bool> deleted;
  const TodolistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
  });
  TodolistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TodolistData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? createdAt,
    Expression<double>? updatedAt,
    Expression<bool>? deleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
    });
  }

  TodolistCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? createdAt,
    Value<double>? updatedAt,
    Value<bool>? deleted,
  }) {
    return TodolistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
    );
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
    if (createdAt.present) {
      map['created_at'] = Variable<double>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<double>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodolistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
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
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  late final GeneratedColumn<double> createdAt = GeneratedColumn<double>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  late final GeneratedColumn<double> updatedAt = GeneratedColumn<double>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT CURRENT_TIMESTAMP',
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  static const VerificationMeta _deletedMeta = const VerificationMeta(
    'deleted',
  );
  late final GeneratedColumn<bool> deleted = GeneratedColumn<bool>(
    'deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL DEFAULT FALSE',
    defaultValue: const CustomExpression('FALSE'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    task,
    done,
    listId,
    createdAt,
    updatedAt,
    deleted,
  ];
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('deleted')) {
      context.handle(
        _deletedMeta,
        deleted.isAcceptableOrUnknown(data['deleted']!, _deletedMeta),
      );
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}updated_at'],
      )!,
      deleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}deleted'],
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
  final double createdAt;
  final double updatedAt;
  final bool deleted;
  const Task({
    required this.id,
    required this.task,
    required this.done,
    required this.listId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['task'] = Variable<String>(task);
    map['done'] = Variable<bool>(done);
    map['list_id'] = Variable<int>(listId);
    map['created_at'] = Variable<double>(createdAt);
    map['updated_at'] = Variable<double>(updatedAt);
    map['deleted'] = Variable<bool>(deleted);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      task: Value(task),
      done: Value(done),
      listId: Value(listId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deleted: Value(deleted),
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
      createdAt: serializer.fromJson<double>(json['created_at']),
      updatedAt: serializer.fromJson<double>(json['updated_at']),
      deleted: serializer.fromJson<bool>(json['deleted']),
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
      'created_at': serializer.toJson<double>(createdAt),
      'updated_at': serializer.toJson<double>(updatedAt),
      'deleted': serializer.toJson<bool>(deleted),
    };
  }

  Task copyWith({
    int? id,
    String? task,
    bool? done,
    int? listId,
    double? createdAt,
    double? updatedAt,
    bool? deleted,
  }) => Task(
    id: id ?? this.id,
    task: task ?? this.task,
    done: done ?? this.done,
    listId: listId ?? this.listId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deleted: deleted ?? this.deleted,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      task: data.task.present ? data.task.value : this.task,
      done: data.done.present ? data.done.value : this.done,
      listId: data.listId.present ? data.listId.value : this.listId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deleted: data.deleted.present ? data.deleted.value : this.deleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('done: $done, ')
          ..write('listId: $listId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, task, done, listId, createdAt, updatedAt, deleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.task == this.task &&
          other.done == this.done &&
          other.listId == this.listId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deleted == this.deleted);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> task;
  final Value<bool> done;
  final Value<int> listId;
  final Value<double> createdAt;
  final Value<double> updatedAt;
  final Value<bool> deleted;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.done = const Value.absent(),
    this.listId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String task,
    this.done = const Value.absent(),
    required int listId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deleted = const Value.absent(),
  }) : task = Value(task),
       listId = Value(listId);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? task,
    Expression<bool>? done,
    Expression<int>? listId,
    Expression<double>? createdAt,
    Expression<double>? updatedAt,
    Expression<bool>? deleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (task != null) 'task': task,
      if (done != null) 'done': done,
      if (listId != null) 'list_id': listId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deleted != null) 'deleted': deleted,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? task,
    Value<bool>? done,
    Value<int>? listId,
    Value<double>? createdAt,
    Value<double>? updatedAt,
    Value<bool>? deleted,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      task: task ?? this.task,
      done: done ?? this.done,
      listId: listId ?? this.listId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deleted: deleted ?? this.deleted,
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
    if (createdAt.present) {
      map['created_at'] = Variable<double>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<double>(updatedAt.value);
    }
    if (deleted.present) {
      map['deleted'] = Variable<bool>(deleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('done: $done, ')
          ..write('listId: $listId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deleted: $deleted')
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
      'UPDATE tasks SET task = ?1, updated_at = CURRENT_TIMESTAMP WHERE id = ?2',
      variables: [Variable<String>(var1), Variable<int>(var2)],
      updates: {tasks},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<String> getTaskName(int var1) {
    return customSelect(
      'SELECT task FROM tasks WHERE id = ?1 AND deleted = FALSE',
      variables: [Variable<int>(var1)],
      readsFrom: {tasks},
    ).map((QueryRow row) => row.read<String>('task'));
  }

  Selectable<Task> getAllTasks(int var1) {
    return customSelect(
      'SELECT * FROM tasks WHERE list_id = ?1 AND deleted = FALSE',
      variables: [Variable<int>(var1)],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getTask(int var1) {
    return customSelect(
      'SELECT * FROM tasks WHERE id = ?1 AND deleted = FALSE',
      variables: [Variable<int>(var1)],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getDoneTasks() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = TRUE AND deleted = FALSE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Future<int> updateTask(bool var1, int var2) {
    return customUpdate(
      'UPDATE tasks SET done = ?1, updated_at = CURRENT_TIMESTAMP WHERE id = ?2',
      variables: [Variable<bool>(var1), Variable<int>(var2)],
      updates: {tasks},
      updateKind: UpdateKind.update,
    );
  }

  Selectable<Task> getUndoneTasks() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = FALSE AND deleted = FALSE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Future<int> softDeleteTask(int var1) {
    return customUpdate(
      'UPDATE tasks SET deleted = TRUE AND updated_at = CURRENT_TIMESTAMP WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {tasks},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> HardDeleteTask(int var1) {
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
      'SELECT * FROM tasks WHERE deleted = FALSE ORDER BY done DESC',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getDoneFalseFirst() {
    return customSelect(
      'SELECT * FROM tasks WHERE deleted = FALSE ORDER BY done ASC',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getOnlyDoneTrue() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = TRUE AND deleted = FALSE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Selectable<Task> getOnlyDoneFalse() {
    return customSelect(
      'SELECT * FROM tasks WHERE done = FALSE AND deleted = FALSE',
      variables: [],
      readsFrom: {tasks},
    ).asyncMap(tasks.mapFromRow);
  }

  Future<int> createList(String var1) {
    return customInsert(
      'INSERT INTO todolist (name, created_at, updated_at) VALUES (?1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)',
      variables: [Variable<String>(var1)],
      updates: {todolist},
    );
  }

  Selectable<TodolistData> getAllLists() {
    return customSelect(
      'SELECT * FROM todolist WHERE deleted = FALSE',
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
    TodolistCompanion Function({
      Value<int> id,
      required String name,
      Value<double> createdAt,
      Value<double> updatedAt,
      Value<bool> deleted,
    });
typedef $TodolistUpdateCompanionBuilder =
    TodolistCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> createdAt,
      Value<double> updatedAt,
      Value<bool> deleted,
    });

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

  ColumnFilters<double> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
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

  ColumnOrderings<double> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
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

  GeneratedColumn<double> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<double> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

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
                Value<double> createdAt = const Value.absent(),
                Value<double> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
              }) => TodolistCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<double> createdAt = const Value.absent(),
                Value<double> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
              }) => TodolistCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
              ),
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
      Value<double> createdAt,
      Value<double> updatedAt,
      Value<bool> deleted,
    });
typedef $TasksUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> task,
      Value<bool> done,
      Value<int> listId,
      Value<double> createdAt,
      Value<double> updatedAt,
      Value<bool> deleted,
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

  ColumnFilters<double> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get deleted => $composableBuilder(
    column: $table.deleted,
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

  ColumnOrderings<double> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get deleted => $composableBuilder(
    column: $table.deleted,
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

  GeneratedColumn<double> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<double> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get deleted =>
      $composableBuilder(column: $table.deleted, builder: (column) => column);

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
                Value<double> createdAt = const Value.absent(),
                Value<double> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                task: task,
                done: done,
                listId: listId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String task,
                Value<bool> done = const Value.absent(),
                required int listId,
                Value<double> createdAt = const Value.absent(),
                Value<double> updatedAt = const Value.absent(),
                Value<bool> deleted = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                task: task,
                done: done,
                listId: listId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                deleted: deleted,
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
