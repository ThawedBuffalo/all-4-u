import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/item_repository_intf.dart';

class CreateFullItemUseCase implements UseCase<void, CreateFullItemParams> {
  final ItemRepositoryInterface repository;

  const CreateFullItemUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(CreateFullItemParams params) async {
    final result = await repository.insertFullItem(
        params.name, params.description, params.categoryIds, params.personIds);
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class CreateFullItemParams extends Equatable {
  final String name;
  final String description;
  final List<int> categoryIds;
  final List<int> personIds;

  const CreateFullItemParams(
      {required this.name,
      required this.description,
      required this.categoryIds,
      required this.personIds})
      : super();

  @override
  List<Object?> get props => [name, description, categoryIds, personIds];
}
