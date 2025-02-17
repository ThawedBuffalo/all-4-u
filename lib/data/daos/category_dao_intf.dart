import '../../domain/entities/category.dart';

abstract class CategoryDAOInterface {
  // Future<Category?> findOne(int categoryId);
  // Future<List<Category>> findAll();
  // Future<void> insert(Category category);
  // Future<void> update(Category category);
  // Future<int> delete(int categoryId);
  // Future<int> deleteAll();
  Future<int> countAll();
}
