import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/usecases/create_person_usecase.dart';
import 'package:all_4_u/domain/usecases/create_person_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/domain/repository/person_repository_mock.mocks.dart';

void main() {
  final PersonRepository repository = MockPersonRepository();
  final CreatePersonUseCase usecase = CreatePersonUseCase(repository);

  final String successTestFirstName = 'successUseCaseTestFirstName';
  final String successTestLastName = 'successUseCaseTestLastName';
  final String failTestFirstName = 'failedUseCaseTestName';
  final int testPersonId = 71114;
  final PersonEntity testPersonEntity =
      PersonEntity(id: testPersonId, firstName: successTestFirstName,
          lastName: successTestLastName);

  setUp(() {
    when(repository.insertPerson(successTestFirstName, successTestLastName))
        .thenAnswer((_) async => Right(testPersonEntity));
    when(repository.insertPerson(failTestFirstName, successTestLastName)).thenAnswer(
        (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
  });

  test('should return PersonEntity', () async {
    final result = await usecase.call(CreatePersonParams(personFirstName: successTestFirstName,
        personLastName: successTestLastName));

    verify(repository.insertPerson(successTestFirstName, successTestLastName)).called(1);
    expect(result, equals(Right(testPersonEntity)));
  });

  test('should return DB Failure', () async {
    final result = await usecase.call(CreatePersonParams(personFirstName: failTestFirstName,
        personLastName: successTestLastName));
    verify(repository.insertPerson(failTestFirstName, successTestLastName)).called(1);
    expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
  });
}
