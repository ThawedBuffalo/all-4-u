import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/item_repository_intf.dart';

class CreateUnassignedItemUseCase implements UseCase<void, CreateUnCatItemParams> {
  final ItemRepositoryInterface repository;

  const CreateUnassignedItemUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(CreateUnCatItemParams params) async {
    final result = await repository.insertItem(params.name,
        params.description, null, params.personIds);
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class CreateUnCatItemParams extends Equatable {
  final String name;
  final String description;

  final List<int> personIds;

  const CreateUnCatItemParams(
      {required this.name, required this.description, required this.personIds})
      : super();

  @override
  List<Object?> get props => [name, description, personIds];
}
