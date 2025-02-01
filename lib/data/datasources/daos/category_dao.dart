import 'package:all_4_u/domain/usecases/delete_all_categories_usecase.dart';
import 'package:floor/floor.dart';

import '../../dtos/category_dto.dart';

@dao
abstract class CategoryDAO {
  @Query('SELECT * FROM category')
  Future<List<CategoryDTO?>> findAllCategories();

  @Query('SELECT * FROM category WHERE id = :id')
  Future<CategoryDTO?> findCategoryByID(int id);

  @insert
  Future<int?> insertCategory(CategoryDTO categoryDTO);

  @update
  Future<void> updateCategory(CategoryDTO categoryDTO);

  @delete
  Future<int?> deleteCategory(CategoryDTO categoryDTO);

  @Query('DELETE from category')
  Future<void> deleteAllCategories();
}
