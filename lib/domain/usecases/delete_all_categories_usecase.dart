import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repositories/category_repository_intf.dart';

class DeleteAllCategoriesUsecase implements UseCase<void, NoParams> {
  final CategoryRepositoryInterface repository;

  const DeleteAllCategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    repository.deleteAllCategories();
    return const Right(null);
  }
}
