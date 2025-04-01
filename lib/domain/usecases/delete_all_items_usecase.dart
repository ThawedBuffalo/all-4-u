import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../repositories/item_repository_intf.dart';

class DeleteAllItemsUsecase implements UseCase<void, NoParams> {
  final ItemRepositoryInterface repository;

  const DeleteAllItemsUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    repository.deleteAllItems();
    return const Right(null);
  }
}
