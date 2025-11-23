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

  //Get List Name
  Future<String> getListName(int id) async {
    final list = await (select(todolist)..where((tbl) => tbl.id.equals(id))).getSingle();
    return list.name;
  }
}