import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/item_repository_intf.dart';

class CreateFullItemUseCase implements UseCase<void, CreateFullItemParams> {
  final ItemRepositoryInterface repository;

  const CreateFullItemUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(CreateFullItemParams params) async {
    final result = await repository.createFullItem(
        name: params.name,
        description: params.description,
        categoryEntityList: params.categories,
        personEntityList: params.people);
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class CreateFullItemParams extends Equatable {
  final String name;
  final String? description;
  final CategoryEntityList? categories;
  final PersonEntityList? people;

  const CreateFullItemParams(
      {required this.name,
      required this.description,
      required this.categories,
      required this.people})
      : super();

  @override
  List<Object?> get props => [name, description, categories, people];
}
