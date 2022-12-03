abstract class IDbConnection<TReturn, TParam> {
  Future<TReturn> initializeDatabase();
  Future<void> createDb(TParam value, int version);
}
