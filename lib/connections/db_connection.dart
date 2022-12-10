import 'dart:io';

import 'package:agenda/connections/database_connection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteConnection implements IDbConnection<Database, Database> {
  static SqfliteConnection? _databaseConnection;
  static Database? _database;

  SqfliteConnection._createInstance();

  String taskTable = 'task';
  String idTask = 'id';
  String nameTask = 'name';
  String dateTask = 'date';
  String initHourTask = 'initHour';
  String endHourTask = 'endHour';
  String sessionsTask = 'sessions';
  String durationTask = 'duration';

  factory SqfliteConnection() {
    // ignore: prefer_conditional_assignment
    if (_databaseConnection == null) {
      _databaseConnection = SqfliteConnection._createInstance();
    }
    return _databaseConnection!;
  }

  Future<Database> get database async {
    // ignore: prefer_conditional_assignment
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  @override
  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'agenda.db';

    var agendaDatabase =
        await openDatabase(path, version: 1, onCreate: createDb);

    return agendaDatabase;
  }

  @override
  Future<void> createDb(Database database, int version) async {
    await database.execute('''
        CREATE TABLE $taskTable(
          $idTask INTEGER PRIMARY KEY AUTOINCREMENT,
          $nameTask TEXT,
          $dateTask TEXT,
          $initHourTask TEXT,
          $endHourTask TEXT,
          $sessionsTask INTEGER,
          $durationTask INTEGER
        )
      ''');
  }

  @override
  String? nameTable;

  @override
  String? getNameTable() {
    return taskTable;
  }

  @override
  Future<int> delete(String table,
      {String? where, List<Object?>? whereArgs}) async {
    Database _db = await database;
    int result = await _db.delete(table, where: where, whereArgs: whereArgs);
    return result;
  }

  @override
  Future<int> insert(String table, Map<String, Object?> values,
      {String? nullColumnHack}) async {
    Database _db = await database;
    int result = await _db.insert(table, values);
    return result;
  }

  @override
  Future<List> query(String table,
      {bool? distinct,
      List<String>? columns,
      String? where,
      List<Object?>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) async {
    Database _db = await database;
    var result = await _db.query(
      table,
      where: where,
      whereArgs: whereArgs,
    );
    return result;
  }

  @override
  Future<int> update(String table, Map<String, Object?> values,
      {String? where, List<Object?>? whereArgs}) async {
    Database _db = await database;
    int result = await _db.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
    return result;
  }

  @override
  setNameTable(value) {
    nameTable = taskTable;
  }
}
