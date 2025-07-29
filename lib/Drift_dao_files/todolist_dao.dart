import 'package:drift/drift.dart';
import 'package:test_windows_projekt/database.dart';

part 'todolist_dao.g.dart';

@DriftAccessor(tables: [Todolist])
class TodolistDao extends DatabaseAccessor<Database> with _$TodolistDaoMixin {
  TodolistDao(Database db) : super(db);

  //Get all Lists
  Stream<List<TodolistData>> getAllLists() {
    return select(todolist)
        .watch();
  }

  //Create List
  Future createList(String name) {
    return into(todolist)
        .insert(
      TodolistCompanion.insert(
        name: name,
      ),
    );
  }
}