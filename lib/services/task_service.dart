import 'package:agenda/connections/db_connection.dart';
import 'package:agenda/helpers/services_helper.dart';
import 'package:agenda/models/tasks.dart';
import 'package:sqflite/sqflite.dart';

class TaskService implements ServicesHelper<Tasks, Tasks> {
  final _databaseConnection = DatabaseConnection();
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
  Future<Tasks?> getById(int id) async {
    Database _db = await _databaseConnection.database;
    List<Map<String, dynamic>> values = await _db.query(
      _databaseConnection.taskTable,
      where: '${_databaseConnection.idTask} = ?',
      whereArgs: [id],
    );
    if (values.isNotEmpty) {
      return Tasks.fromJson(values.first);
    } else {
      return null;
    }
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
