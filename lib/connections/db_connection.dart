import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  static DatabaseConnection? _databaseConnection;
  static Database? _database;

  DatabaseConnection._createInstance();

  String taskTable = 'task';
  String idTask = 'id';
  String nameTask = 'name';
  String dateTask = 'date';
  String initHourTask = 'initHour';
  String endHourTask = 'endHour';
  String sessionsTask = 'sessions';
  String durationTask = 'duration';

  factory DatabaseConnection() {
    // ignore: prefer_conditional_assignment
    if (_databaseConnection == null) {
      _databaseConnection = DatabaseConnection._createInstance();
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

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'agenda.db';

    var agendaDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);

    return agendaDatabase;
  }

  Future<void> _createDb(Database database, int version) async {
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
}
