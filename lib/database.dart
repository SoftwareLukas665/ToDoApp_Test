import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
import 'Drift_dao_files/task_dao.dart';
import 'Drift_dao_files/todolist_dao.dart';
part 'database.g.dart';



class Todolist extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get user_id => text().nullable()();
  TextColumn get name => text().withLength(min: 1)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get deleted => boolean().withDefault(Constant(false))();
}

class Task extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get task => text().withLength(min: 1)();
  IntColumn get listId => integer().references(Todolist, #id)();
  BoolColumn get done => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get deleted => boolean().withDefault(Constant(false))();
}

//Öffnet die Verbindung zur Datenbank und legt die Version der Datenbank (hier auf 1) fest
@DriftDatabase(tables: [Todolist, Task], daos: [TaskDao, TodolistDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Öffnet die Datenbankverbindung und legt den Pfad fest
// Speicherort der Datenbank wird angegeben (sqflite-Datei)
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'todo.sqlite'));
    return NativeDatabase(file);
  });
}