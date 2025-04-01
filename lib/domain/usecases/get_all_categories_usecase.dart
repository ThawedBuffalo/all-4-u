import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class GetAllCategoriesUsecase implements UseCase<void, NoParams> {
  final CategoryRepositoryInterface repository;

  const GetAllCategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    final result = await repository.getAllCategories();
    if (result.isLeft()) {
      return Future.value(
          Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE)));
    }
    return Future.value(result);
  }
}
