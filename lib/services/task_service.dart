import 'package:agenda/connections/database_connection.dart';
import 'package:agenda/models/tasks.dart';
import 'package:agenda/repository/services_repository.dart';

class TaskService implements ServicesRepository<Tasks, Tasks> {
  final IDbConnection iConnection;
  TaskService(
    this.iConnection,
  );
  @override
  Future<int> delete(int id, String where) async {
    var result = await iConnection.delete(
      iConnection.getNameTable()!,
      where: '$where = ?',
      whereArgs: [id],
    );
    return result;
  }

  @override
  Future<List<Tasks>> getAll() async {
    var result = await iConnection.query(
      iConnection.getNameTable()!,
    );
    List<Tasks> tasks =
        result.isNotEmpty ? result.map((e) => Tasks.fromJson(e)).toList() : [];
    return tasks;
  }

  @override
  Future<List<Tasks>> getByValue(value, String whereArg) async {
    var result = await iConnection.query(
      iConnection.getNameTable()!,
      where: '$whereArg = ?',
      whereArgs: [value],
    );
    List<Tasks> values =
        result.isNotEmpty ? result.map((e) => Tasks.fromJson(e)).toList() : [];
    return values;
  }

  @override
  Future<int> insert(Tasks task) async {
    var result = await iConnection.insert(
      iConnection.getNameTable()!,
      task.toJson(),
    );
    return result;
  }

  @override
  Future<int> update(Tasks task, String where) async {
    var result = await iConnection.update(
      iConnection.getNameTable()!,
      task.toJson(),
      where: '$where = ?',
      whereArgs: [task.id],
    );
    return result;
  }
}
