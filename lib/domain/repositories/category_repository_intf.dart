import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/category_entity.dart';
import '../entities/category_entity_list.dart';

abstract class CategoryRepositoryInterface {
  Future<Either<Failure, int>> countCategories();
  Future<Either<Failure, int>> createCategory({required final String name});
  Future<Either<Failure, CategoryEntity>> getCategoryById(
      {required final int id});
  Future<Either<Failure, CategoryEntityList>> getAllCategories();
  Future<Either<Failure, int>> updateCategory(
      {required final CategoryEntity category});
  void deleteCategory({required int categoryId});
  void deleteAllCategories();
}
