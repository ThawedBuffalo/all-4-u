import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/item_repository_intf.dart';

class CreateUnCategorizedItemUseCase
    implements UseCase<void, CreateUncategorizedItemParams> {
  final ItemRepositoryInterface repository;

  const CreateUnCategorizedItemUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(
      CreateUncategorizedItemParams params) async {
    final result = await repository.createUncategorizedItem(
        name: params.name,
        description: params.description,
        personEntityList: params.people);
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class CreateUncategorizedItemParams extends Equatable {
  final String name;
  final String? description;
  final PersonEntityList? people;

  const CreateUncategorizedItemParams(
      {required this.name, required this.description, required this.people})
      : super();

  @override
  List<Object?> get props => [name, description, people];
}
