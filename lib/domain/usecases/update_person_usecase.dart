// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/core/usecases/usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../core/error/error_messages.dart';
// import '../repositories/person_repository_intf.dart';
//
// class UpdatePersonUseCase implements UseCase<void, UpdatePersonParams> {
//   final PersonRepositoryInterface repository;
//
//   const UpdatePersonUseCase(this.repository);
//
//
//   //  Future<Either<Failure, PersonEntity>> updatePerson(
//   //       final int id, final String firstName, String personLastName);
//
//   @override
//   Future<Either<Failure, dynamic>> call(UpdatePersonParams params) async {
//     final result = await repository.updatePerson(params.personId,
//         params.personFirstName, params.personLastName);
//     if (result.isLeft()) {
//       return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//     }
//     return Future.value(result);
//   }
// }
//
// class UpdatePersonParams extends Equatable {
//   final int personId;
//   final String personFirstName;
//   final String personLastName;
//
//   const UpdatePersonParams({required this.personId,
//     required this.personFirstName, required this.personLastName})
//       : super();
//
//   @override
//   List<Object?> get props => [personId, personFirstName, personLastName];
// }
