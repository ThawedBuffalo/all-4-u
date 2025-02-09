// import 'package:all_4_u/core/error/error_messages.dart';
// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/data/repositories/person_repository.dart';
// import 'package:all_4_u/domain/entities/person_entity.dart';
// import 'package:all_4_u/domain/usecases/update_person_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../mock/domain/repository/person_repository_mock.mocks.dart';
//
// void main() {
//   final PersonRepository repository = MockPersonRepository();
//   final UpdatePersonUseCase usecase = UpdatePersonUseCase(repository);
//
//   final String successTestFirstName = 'successUseCaseTestFirstName';
//   final String failTestFirstName = 'failedUseCaseTestFirstName';
//   final String testLastName = 'useCaseTestLastName';
//   final int testPersonId = 71114;
//   final PersonEntity testPersonEntity = PersonEntity(
//       id: testPersonId,
//       firstName: successTestFirstName,
//       lastName: testLastName);
//
//   setUp(() {
//     when(repository.updatePerson(
//             testPersonId, successTestFirstName, testLastName))
//         .thenAnswer((_) async => Right(testPersonEntity));
//     when(repository.updatePerson(testPersonId, failTestFirstName, testLastName))
//         .thenAnswer(
//             (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//   });
//
//   test('should return PersonEntity', () async {
//     final result = await usecase.call(UpdatePersonParams(
//         personId: testPersonId,
//         personFirstName: successTestFirstName,
//         personLastName: testLastName));
//
//     verify(repository.updatePerson(
//             testPersonId, successTestFirstName, testLastName))
//         .called(1);
//     expect(result, equals(Right(testPersonEntity)));
//   });
//
//   test('should return DB Failure', () async {
//     final result = await usecase.call(UpdatePersonParams(
//         personId: testPersonId,
//         personFirstName: failTestFirstName,
//         personLastName: testLastName));
//
//     verify(repository.updatePerson(
//             testPersonId, failTestFirstName, testLastName))
//         .called(1);
//     expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
//   });
// }
