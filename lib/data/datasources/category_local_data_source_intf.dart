import '../../domain/entities/category.dart';

abstract class CategoryLocalDataSourceInterface {
  Future<void> saveCategory(Category userCategory);
  Category getCategory(String categoryName);
}