import 'package:all_4_u/data/mapper/category_entity_list_mapper.dart';
import 'package:all_4_u/data/mapper/category_entity_mapper.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository_intf.dart';
import '../datasources/database/all4u_database.dart';
import '../models/category_model.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final All4UDatabase database;

  const CategoryRepository({required this.database});

  @override
  Future<Either<Failure, CategoryEntity>> insertCategory(
      final String name) async {
    final CategoryModel categoryModel = await database
        .insertCategory(CategoryEntityMapper.transformToNewModelMap(name));
    if (categoryModel['id'] == null) {
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return (Right(
          CategoryEntityMapper.transformModelToEntity(categoryModel)));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(int id) async {
    final CategoryModel categoryModel = await database.getCategoryById(id);

    if (categoryModel.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return (Right(
          CategoryEntityMapper.transformModelToEntity(categoryModel)));
    }
  }

  @override
  Future<Either<Failure, CategoryEntityList>> getAllCategories() async {
    final CategoryModelList modelList = await database.getAllCategories();

    if (modelList.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return (Right(
          CategoryEntityListMapper.transformModelToEntity(modelList)));
    }
  }

  @override
  Future<void> deleteCategoryById(final int id) async =>
      await database.deleteCategoryById(id);

  @override
  Future<void> deleteAllCategories() async {
    await database.deleteAllCategories();
  }

  @override
  Future<Either<Failure, CategoryEntity>> updateCategory(
      int id, String categoryName) async {
    final CategoryModel categoryModel = await database.updateCategory(
        CategoryEntityMapper.transformToModelMap(id, categoryName));
    if (categoryModel['id'] == null) {
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return (Right(
          CategoryEntityMapper.transformModelToEntity(categoryModel)));
    }
  }
}
