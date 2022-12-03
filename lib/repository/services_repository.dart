abstract class ServicesRepository<TReturn, TParam> {
  Future<int> insert(TParam param);
  Future<int> update(TParam param);
  Future<int> delete(int id);
  Future<List<TReturn>> getAll();
  Future<List<TReturn>> getByValue(String id);
}
