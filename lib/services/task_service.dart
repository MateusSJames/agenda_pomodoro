import 'package:agenda/connections/db_connection.dart';
import 'package:agenda/models/tasks.dart';
import 'package:agenda/repository/services_repository.dart';
import 'package:sqflite/sqflite.dart';

class TaskService implements ServicesRepository<Tasks, Tasks>{
  final _databaseConnection = SqfliteConnection();
  @override
  Future<int> delete(int id) async {
    Database _db = await _databaseConnection.database;
    var result = await _db.delete(
      _databaseConnection.taskTable,
      where: '${_databaseConnection.idTask} = ?',
      whereArgs: [id],
    );
    return result;
  }

  @override
  Future<List<Tasks>> getAll() async {
    Database _db = await _databaseConnection.database;
    var result = await _db.query(
      _databaseConnection.taskTable,
    );
    List<Tasks> tasks =
        result.isNotEmpty ? result.map((e) => Tasks.fromJson(e)).toList() : [];
    return tasks;
  }

  @override
  Future<List<Tasks>> getByValue(value) async {
    Database _db = await _databaseConnection.database;
    var result = await _db.query(
      _databaseConnection.taskTable,
      where: '${_databaseConnection.dateTask} = ?',
      whereArgs: [value],
    );
    List<Tasks> values =
        result.isNotEmpty ? result.map((e) => Tasks.fromJson(e)).toList() : [];
    return values;
  }

  @override
  Future<int> insert(Tasks task) async {
    Database _db = await _databaseConnection.database;
    var result = await _db.insert(
      _databaseConnection.taskTable,
      task.toJson(),
    );
    return result;
  }

  @override
  Future<int> update(Tasks task) async {
    Database _db = await _databaseConnection.database;
    var result = await _db.update(
      _databaseConnection.taskTable,
      task.toJson(),
      where: '${_databaseConnection.idTask} = ?',
      whereArgs: [task.id],
    );
    return result;
  }
}
