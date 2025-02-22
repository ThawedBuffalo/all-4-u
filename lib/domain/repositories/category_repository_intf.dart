import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/category.dart';
import '../entities/category_entity_list.dart';

abstract class CategoryRepositoryInterface {
  Future<Either<Failure, int>> countCategories();
  Future<Either<Failure, CategoryEntity>> createCategory(final String name);
  //Future<Either<Failure, CategoryEntity>> getCategoryById(final int id);
  // Future<Either<Failure, CategoryEntityList>> getAllCategories();
  // Future<Either<Failure, CategoryEntity>> updateCategory(
  //     CategoryEntity category);
  // Future<void> deleteCategory(CategoryEntity category);
  // Future<void> deleteAllCategories();
}
