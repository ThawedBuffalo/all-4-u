import 'package:dartz/dartz.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository_intf.dart';

import 'package:all_4_u/objectbox.g.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final Store categoryStore;
  late final Box<CategoryEntity> categoryBox;

  CategoryRepository({required this.categoryStore}) {
    categoryBox = Box<CategoryEntity>(categoryStore);
  }

  @override
  Future<Either<Failure, CategoryEntity>> createCategory(String name) async {
    CategoryEntity category = CategoryEntity(id: null, name: name);
    late int response;
    try {
      response = categoryBox.put(category);
      return Right(CategoryEntity(id: response, name: name));
    } on Exception catch (_, e) {
      //return Left(DBFailure(errorMessage: e.toString()));
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    }
  }

  // @override
  // Future<Either<Failure, int>> deleteCategory(CategoryEntity category) async {
  //   // map entity to dto
  //   CategoryDTO categoryDTO =
  //       CategoryEntityMapper.transformEntityToDTO(category);
  //   int? response = await database.categoryDAO.deleteCategory(categoryDTO);
  //   if (response == null) {
  //     // error
  //     return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
  //   } else {
  //     return Right(response);
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, CategoryEntityList>> getAllCategories() async {
  //   List<CategoryDTO?> categoryDTOList =
  //       await database.categoryDAO.getAllCategories();
  //   if (categoryDTOList.isEmpty) {
  //     // error
  //     return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
  //   } else {
  //     return Right(CategoryEntityListMapper.transformDTOListToEntityList(
  //         categoryDTOList));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, CategoryEntity>> getCategoryById(int id) async {
  //   CategoryDTO? categoryDTO = await database.categoryDAO.getCategoryByID(id);
  //   if (categoryDTO?.id == null) {
  //     // error
  //     return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
  //   } else {
  //     return Right(CategoryEntityMapper.transformDTOToEntity(categoryDTO!));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, CategoryEntity>> updateCategory(
  //     CategoryEntity category) async {
  //   // map entity to dto
  //   CategoryDTO categoryDTO =
  //       CategoryEntityMapper.transformEntityToDTO(category);
  //   int? numberUpdated = await database.categoryDAO.updateCategory(categoryDTO);
  //   if (numberUpdated == null) {
  //     // error
  //     return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
  //   } else {
  //     return Right(CategoryEntityMapper.transformDTOToEntity(categoryDTO!));
  //   }
  // }
  //
  // @override
  // Future<void> deleteAllCategories() {
  //   // TODO: implement deleteAllCategories
  //   throw UnimplementedError();
  // }
}
