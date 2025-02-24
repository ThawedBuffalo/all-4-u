import 'package:all_4_u/core/helpers/EitherX.dart';
import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
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
  Future<Either<Failure, int>> createCategory(String name) async {
    // must set ID to 0 for DB to autoincrement
    CategoryDTO category = CategoryDTO(id: 0, name: name);
    final result = await categoryDAO.insert(category);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }

  @override
  Future<void> deleteCategory(int categoryId) async {
    await categoryDAO.delete(categoryId);
  }

  @override
  void deleteAllCategories() {
    categoryDAO.deleteAll();
  }

  @override
  Future<Either<Failure, CategoryEntityList>> getAllCategories() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(int id) async {
    final List<CategoryDTO> categoryDTOList = await categoryDAO.findOne(id);

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
  Future<Either<Failure, CategoryEntity>> updateCategory(
      CategoryEntity category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
