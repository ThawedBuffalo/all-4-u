import 'package:injectable/injectable.dart';

import '../../domain/entities/category.dart';
import '../dtos/category_dto.dart';

abstract class CategoryDAOInterface {
  // Future<Category?> findOne(int categoryId);
  // Future<List<Category>> findAll();
  void insert(CategoryDTO category);
  // Future<void> update(Category category);
  // Future<int> delete(int categoryId);
  // Future<int> deleteAll();
  int countAll();
}
