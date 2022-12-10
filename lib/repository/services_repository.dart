abstract class ServicesRepository<TReturn, TParam> {
  Future<int> insert(TParam param);
  Future<int> update(TParam param, String where);
  Future<int> delete(int id, String where);
  Future<List<TReturn>> getAll();
  Future<List<TReturn>> getByValue(String id, String where);
}
