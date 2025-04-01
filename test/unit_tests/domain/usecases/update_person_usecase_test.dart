import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/usecases/update_person_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_person_dto_factory.dart';
import 'update_person_usecase_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  final PersonRepository repository = MockPersonRepository();
  final UpdatePersonUseCase usecase = UpdatePersonUseCase(repository);

  FakePersonDTOFactory personDTOFactory = FakePersonDTOFactory();
  PersonDTO testSuccessPersonDTO = personDTOFactory.generateFake();
  PersonEntity testSuccessPersonEntity =
      personDTOFactory.generateFakeEntity(testSuccessPersonDTO);
  PersonDTO testFailurePersonDTO = personDTOFactory.generateFake();
  PersonEntity testFailurePersonEntity =
      personDTOFactory.generateFakeEntity(testFailurePersonDTO);

  group('-> updatePerson() <-', () {
    test('should return id', () async {
      CustomLogger.loggerNoStack.i('-> updatePerson() <- test starting...');
      when(repository.updatePerson(person: testSuccessPersonEntity))
          .thenAnswer((_) async => Right(testSuccessPersonEntity.id));
      final result = await usecase.call(UpdatePersonParams(
          personId: testSuccessPersonEntity.id,
          personFirstName: testSuccessPersonEntity.firstName,
          personLastName: testSuccessPersonEntity.lastName));

      verify(repository.updatePerson(person: testSuccessPersonEntity))
          .called(1);
      expect(result, equals(Right(testSuccessPersonEntity.id)));
    });

    test('should return DB Failure', () async {
      CustomLogger.loggerNoStack.i('-> updatePerson() <- test starting...');
      when(repository.updatePerson(person: testFailurePersonEntity)).thenAnswer(
          (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));

      final result = await usecase.call(UpdatePersonParams(
          personId: testFailurePersonEntity.id,
          personFirstName: testFailurePersonEntity.firstName,
          personLastName: testFailurePersonEntity.lastName));

      verify(repository.updatePerson(person: testFailurePersonEntity))
          .called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
