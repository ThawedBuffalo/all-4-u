import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/repositories/category_repository_intf.dart';

@Injectable()
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
