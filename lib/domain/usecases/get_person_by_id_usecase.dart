import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/person_repository_intf.dart';

class GetPersonByIdUseCase implements UseCase<void, GetPersonByIdParams> {
  final PersonRepositoryInterface repository;

  const GetPersonByIdUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(GetPersonByIdParams params) async {
    if (params.props == null) {
      // error - no params
      return Future.value(Left(EmptyParams(errorMessage: PARAM_ERROR)));
    }
    final result = await repository.getPersonById(id: params.personId);
    return Future.value(result);
  }
}

class GetPersonByIdParams extends Equatable {
  final int personId;

  const GetPersonByIdParams({required this.personId}) : super();

  @override
  List<Object?> get props => [personId];
}
