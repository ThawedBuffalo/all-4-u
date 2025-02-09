// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/core/usecases/usecase.dart';
// import 'package:dartz/dartz.dart';
// import '../repositories/category_repository_intf.dart';
// import '../repositories/person_repository_intf.dart';
//
// class GetAllPeopleUsecase implements UseCase<void, NoParams> {
//   final PersonRepositoryInterface repository;
//
//   const GetAllPeopleUsecase(this.repository);
//
//   @override
//   Future<Either<Failure, dynamic>> call(NoParams params) async {
//     final result = await repository.getAllPeople();
//     return Future.value(result);
//   }
// }
