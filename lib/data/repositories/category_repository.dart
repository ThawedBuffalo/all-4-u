import 'package:all_4_u/core/helpers/EitherX.dart';
import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/mapper/category_entity_list_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/category_entity_list.dart';
import '../../domain/repositories/category_repository_intf.dart';
import '../mapper/category_entity_mapper.dart';

@Injectable(as: CategoryRepositoryInterface)
class CategoryRepository implements CategoryRepositoryInterface {
  final CategoryDAOInterface categoryDAO;
  CategoryRepository({required this.categoryDAO});

  @override
  Future<Either<Failure, int>> countCategories() async {
    final numberOfCategories = await categoryDAO.countAll();
    if (numberOfCategories == 0) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return Right(numberOfCategories);
    }
  }

  @override
  Future<Either<Failure, int>> createCategory(
      {required final String name}) async {
    // must set ID to 0 for DB to autoincrement
    CategoryDTO category = CategoryDTO(id: 0, name: name);
    final result = await categoryDAO.insert(category: category);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }

  @override
  void deleteCategory({required int categoryId}) {
    categoryDAO.delete(categoryId: categoryId);
  }

  @override
  void deleteAllCategories() {
    categoryDAO.deleteAll();
  }

  @override
  Future<Either<Failure, CategoryEntityList>> getAllCategories() async {
    final List<CategoryDTO> categoryDTOList = await categoryDAO.findAll();

    if (categoryDTOList.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return Right(CategoryEntityListMapper.transformDTOListToEntityList(
          categoryDTOList));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(
      {required final int id}) async {
    final List<CategoryDTO> categoryDTOList =
        await categoryDAO.findOne(categoryId: id);

    if (categoryDTOList.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      if (categoryDTOList.length > 1) {
        return Left(DBEmptyResult(errorMessage: DB_RETURNED_MORE));
      } else {
        return Right(
            CategoryEntityMapper.transformDTOToEntity(categoryDTOList[0]));
      }
    }
  }

  @override
  Future<Either<Failure, int>> updateCategory(
      {required final CategoryEntity category}) async {
    final result = await categoryDAO.insert(
        category: CategoryEntityMapper.transformEntityToDTO(category));
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }
}
