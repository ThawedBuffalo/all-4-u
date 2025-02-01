import 'package:all_4_u/data/datasources/database/all4u_db.dart';
import 'package:all_4_u/data/mapper/category_entity_list_mapper.dart';
import 'package:all_4_u/data/mapper/category_entity_mapper.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/category_repository_intf.dart';
import '../dtos/category_dto.dart';

class CategoryRepository implements CategoryRepositoryInterface {
  final All4UDb database;

  const CategoryRepository({required this.database});

  @override
  Future<Either<Failure, CategoryEntity>> createCategory(String name) async {
    CategoryDTO categoryDTO = CategoryDTO(id: null, name: name);
    int? response = await database.categoryDAO.insertCategory(categoryDTO);
    if (response == 0) {
      // error
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return Right(CategoryEntity(id: response, name: name));
    }
  }

  @override
  Future<Either<Failure, int>> deleteCategory(CategoryEntity category) async {
    // map entity to dto
    CategoryDTO categoryDTO =
        CategoryEntityMapper.transformEntityToDTO(category);
    int? response = await database.categoryDAO.deleteCategory(categoryDTO);
    if (response == null) {
      // error
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return Right(response);
    }
  }

  @override
  Future<Either<Failure, CategoryEntityList>> getAllCategories() async {
    List<CategoryDTO?> categoryDTOList =
        await database.categoryDAO.getAllCategories();
    if (categoryDTOList.isEmpty) {
      // error
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return Right(CategoryEntityListMapper.transformDTOListToEntityList(
          categoryDTOList));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(int id) async {
    CategoryDTO? categoryDTO = await database.categoryDAO.getCategoryByID(id);
    if (categoryDTO?.id == null) {
      // error
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return Right(CategoryEntityMapper.transformDTOToEntity(categoryDTO!));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> updateCategory(
      CategoryEntity category) async {
    // map entity to dto
    CategoryDTO categoryDTO =
        CategoryEntityMapper.transformEntityToDTO(category);
    CategoryDTO? response =
        await database.categoryDAO.updateCategory(categoryDTO);
    if (response == null) {
      // error
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return Right(CategoryEntityMapper.transformDTOToEntity(categoryDTO!));
    }
  }

  @override
  Future<void> deleteAllCategories() {
    // TODO: implement deleteAllCategories
    throw UnimplementedError();
  }
}
