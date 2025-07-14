import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:drift/native.dart';
part 'database.g.dart';

//Öffnet die Verbindung zur Datenbank und legt die Version der Datenbank (hier auf 1) fest
@DriftDatabase(include: {'database.drift'})
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