// import 'package:all_4_u/core/error/error_messages.dart';
// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/domain/entities/person_entity.dart';
// import 'package:all_4_u/domain/repositories/person_repository_intf.dart';
// import 'package:all_4_u/domain/usecases/get_person_by_id_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../mock/domain/repository/category_repository_mock.mocks.dart';
// import '../../mock/domain/repository/person_repository_mock.mocks.dart';
//
// void main() {
//   final PersonRepositoryInterface repository = MockPersonRepository();
//   final GetPersonByIdUseCase usecase = GetPersonByIdUseCase(repository);
//
//   final String successTestFirstName = 'successUseCaseTestFirstName';
//   final String successTestLastName = 'successUseCaseTestLastName';
//   final int successPersonId = 71114;
//   final int failPersonId = 1;
//   final PersonEntity testPersonEntity = PersonEntity(
//       id: successPersonId,
//       firstName: successTestFirstName,
//       lastName: successTestLastName);
//
//   setUp(() {
//     when(repository.getPersonById(successPersonId))
//         .thenAnswer((_) async => Right(testPersonEntity));
//     when(repository.getPersonById(failPersonId)).thenAnswer(
//         (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//   });
//
//   test('should return PersonEntity', () async {
//     final result =
//         await usecase.call(GetPersonByIdParams(personId: successPersonId));
//
//     verify(repository.getPersonById(successPersonId)).called(1);
//     expect(result, equals(Right(testPersonEntity)));
//   });
//
//   test('should return DB Failure', () async {
//     final result =
//         await usecase.call(GetPersonByIdParams(personId: failPersonId));
//
//     verify(repository.getPersonById(failPersonId)).called(1);
//     expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
//   });
// }
