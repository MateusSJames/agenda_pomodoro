abstract class IDbConnection<TReturn, TParam> {
  String? nameTable;

  setNameTable(value) {
    nameTable = value;
  }

  String? getNameTable() {
    return nameTable;
  }

  Future<TReturn> initializeDatabase();
  Future<void> createDb(TParam value, int version);
  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  });
  Future<List> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  });
  Future<int> insert(
    String table,
    Map<String, Object?> values, {
    String? nullColumnHack,
  });
  Future<int> update(
    String table,
    Map<String, Object?> values, {
    String? where,
    List<Object?>? whereArgs,
  });
}
