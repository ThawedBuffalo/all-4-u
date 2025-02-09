// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/core/usecases/usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../repositories/person_repository_intf.dart';
//
// class DeletePersonByIdUsecase implements UseCase<void, DeletePersonParams> {
//   final PersonRepositoryInterface repository;
//
//   const DeletePersonByIdUsecase(this.repository);
//
//   @override
//   Future<Either<Failure, void>> call(DeletePersonParams params) async {
//     await repository.deletePersonById(params.personId);
//     return const Right(null);
//   }
// }
//
// class DeletePersonParams extends Equatable {
//   final int personId;
//
//   const DeletePersonParams({required this.personId}) : super();
//
//   @override
//   List<Object?> get props => [personId];
// }
