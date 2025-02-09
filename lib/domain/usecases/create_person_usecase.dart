// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/core/usecases/usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../core/error/error_messages.dart';
// import '../repositories/person_repository_intf.dart';
//
// class CreatePersonUseCase implements UseCase<void, CreatePersonParams> {
//   final PersonRepositoryInterface repository;
//
//   const CreatePersonUseCase(this.repository);
//
//   @override
//   Future<Either<Failure, dynamic>> call(CreatePersonParams params) async {
//     final result = await repository.insertPerson(params.personFirstName, params.personLastName);
//     if (result.isLeft()) {
//       return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//     }
//     return Future.value(result);
//   }
// }
//
// class CreatePersonParams extends Equatable {
//   final String personFirstName;
//   final String personLastName;
//
//   const CreatePersonParams({required this.personFirstName,
//     required this.personLastName}) : super();
//
//   @override
//   List<Object?> get props => [personFirstName, personLastName];
// }
