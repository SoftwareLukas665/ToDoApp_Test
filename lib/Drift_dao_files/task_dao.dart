import 'package:drift/drift.dart';
import 'package:test_windows_projekt/database.dart';

part 'task_dao.g.dart';

@DriftAccessor(tables: [Task])
class TaskDao extends DatabaseAccessor<Database> with _$TaskDaoMixin {
  TaskDao(Database db) : super(db);

  //Create Task
  Future createTask(String name, int listId) {
    return into(task).insert(
      TaskCompanion.insert(
        task: name,
        listId: listId,
      ),
    );
  }

  //Edit Task
  Future changeTask(int id, String name) {
    return (update(task)..where((t) => t.id.equals(id))).write(
        TaskCompanion(
          task: Value(name),
          updatedAt: Value(DateTime.now()),
        )
    );
  }

  //SoftDelete Task
  Future softDeleteTask(int id) {
    return (update(task)..where((t) => t.id.equals(id))).write(
        TaskCompanion(
          deleted: Value(true),
          updatedAt: Value(DateTime.now()),
        )
    );
  }

  //Update Task
  Future updateTask(int id, bool done) {
    return (update(task)..where((t) => t.id.equals(id))).write(
        TaskCompanion(
          done: Value(done),
          updatedAt: Value(DateTime.now()),
        )
    );
  }

  //Get All Tasks
  Stream<List<TaskData>> getAllTasks(int listid) {
    return (select(task)
        ..where((t) => t.listId.equals(listid))
        ..where((t) => t.deleted.equals(false))).watch();
  }

  //GetOnlyDoneFalse
  Stream<List<TaskData>> getOnlyDoneFalse(int listid) {
    return (select(task)
        ..where((t) => t.listId.equals(listid))
        ..where((t) => t.done.equals(false))
        ..where((t) => t.deleted.equals(false))).watch();
  }

  //GetOnlyDoneTrue
  Stream<List<TaskData>> getOnlyDoneTrue(int listid) {
    return (select(task)
        ..where((t) => t.listId.equals(listid))
        ..where((t) => t.done.equals(true))
        ..where((t) => t.deleted.equals(false))).watch();
  }

  //GetDoneTrueFirst
  Stream<List<TaskData>> getDoneTrueFirst(int listid) {
    return (select(task)
        ..where((t) => t.listId.equals(listid))
        ..where((t) => t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm(expression: t.done, mode: OrderingMode.desc)]))
        .watch();
  }

  //GetDoneFalseFirst
  Stream<List<TaskData>> getDoneFalseFirst(int listid) {
    return (select(task)
        ..where((t) => t.listId.equals(listid))
        ..where((t) => t.deleted.equals(false))
        ..orderBy([(t) => OrderingTerm(expression: t.done, mode: OrderingMode.asc)]))
        .watch();
  }

  //GetAllSoftDeletedTasks
  Stream<List<TaskData>> getAllSoftDeletedTasks() {
    return (select(task)
        ..where((t) => t.deleted.equals(true))).watch();
  }
}