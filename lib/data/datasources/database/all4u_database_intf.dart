import '../../../domain/entities/category_entity.dart';
import '../../models/category_model.dart';

abstract class All4UDatabaseInterface {
  Future<CategoryModel> allCategories();
  Future<CategoryModel> insertCategory(final CategoryModel categoryModel);
  Future<void> updateCategory(final CategoryModel categoryModel);
  Future<void> deleteCategory(final int id);
}
