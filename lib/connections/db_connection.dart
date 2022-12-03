import 'dart:io';

import 'package:agenda/connections/database_connection.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteConnection implements IDbConnection<Database, Database>{
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
}
