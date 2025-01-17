import '../../../domain/entities/category_entity.dart';
import '../../models/category_model.dart';

abstract class All4UDatabaseInterface {
  Future<CategoryModel> getAllCategories();
  Future<CategoryModel> insertCategory(final CategoryModel categoryModel);
  Future<CategoryModel> getCategoryById(final int id);
  //Future<CategoryModel> updateCategory(final CategoryModel categoryModel);
  //Future<void> deleteCategory(final int id);
}
