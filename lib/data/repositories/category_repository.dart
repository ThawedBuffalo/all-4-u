import 'package:dartz/dartz.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository_intf.dart';
import '../datasources/category_local_data_source_intf.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final CategoryLocalDataSourceInterface dataSource;

  CategoryRepository({required this.dataSource});

  @override
  Future<Either<Failure, Category>> saveCategory(Category categoryToSave) {
    // TODO: implement saveCategory
    throw UnimplementedError();
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
