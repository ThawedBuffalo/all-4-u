import 'package:all_4_u/data/mapper/category_entity_mapper.dart';
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
      return (Right(CategoryEntityMapper.transformToEntity(categoryModel)));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(int id) async {
    final CategoryModel categoryModel = await database.getCategoryById(id);
    if (categoryModel['id'] == null) {
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return (Right(CategoryEntityMapper.transformToEntity(categoryModel)));
    }
  }

  // @override
  // Either<Failure, Category>> getCategory(String categoryName) {
  //   try {
  //     final localCategory = dataSource.getCategory(categoryName);
  //     return (Right(localCategory));
  //   } on LocalStoreException {
  //     return Left(LocalStorageFailure(errorMessage: LOCAL_STORAGE_FAILURE));
  //   }
  // }

  // Either<Failure, Category> getSettingsData() {
  //   try {
  //     final localSettings = dataSource.getSettingsData();
  //     return (Right(localSettings));
  //   } on LocalStoreException {
  //     return Left(LocalStorageFailure(errorMessage: LOCAL_STORAGE_FAILURE));
  //   }
  // }

  // @override
  // Future<Either<Failure, Category>> saveCategory(Category categoryToSave) {
  //   try {
  //     final localCategory = dataSource.getCategory(categoryToSave);
  //     return (Right(localCategory));
  //   } on LocalStoreException {
  //     return Left(LocalStorageFailure(errorMessage: LOCAL_STORAGE_FAILURE));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, Category>> getCategory(String categoryName) {
  //   // TODO: implement getCategory
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Either<Failure, void>> saveCategory(Category userCategory) async {
  //   try {
  //     return Right(await dataSource.saveCategory(userCategory));
  //   } on LocalStoreException {
  //     return Left(LocalStorageFailure(errorMessage: LOCAL_STORAGE_FAILURE));
  //   }
  // }
}
