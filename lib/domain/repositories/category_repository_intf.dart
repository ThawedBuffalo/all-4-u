import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/category_entity.dart';
import '../entities/category_entity_list.dart';

abstract class CategoryRepositoryInterface {
  Future<Either<Failure, CategoryEntity>> insertCategory(final String name);
  Future<Either<Failure, CategoryEntity>> getCategoryById(final int id);
  Future<Either<Failure, CategoryEntityList>> getAllCategories();
  //Future<Either<Failure, CategoryEntity>> updateCategory(final int id, final String name);
  Future<void> deleteCategoryById(final int id);
  Future<void> deleteAllCategories();
}
