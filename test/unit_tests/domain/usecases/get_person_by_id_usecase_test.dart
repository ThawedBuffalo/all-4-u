import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/repositories/person_repository_intf.dart';
import 'package:all_4_u/domain/usecases/get_person_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_person_dto_factory.dart';
import 'get_person_by_id_usecase_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  final PersonRepositoryInterface repository = MockPersonRepository();
  final GetPersonByIdUseCase usecase = GetPersonByIdUseCase(repository);

  FakePersonDTOFactory personDTOFactory = FakePersonDTOFactory();
  PersonDTO testSuccessPersonDTO = personDTOFactory.generateFake();
  PersonEntity testSuccessPersonEntity =
      personDTOFactory.generateFakeEntity(testSuccessPersonDTO);
  PersonDTO testFailurePersonDTO = personDTOFactory.generateFake();
  PersonEntity testFailurePersonEntity =
      personDTOFactory.generateFakeEntity(testFailurePersonDTO);

  group('-> getPersonById() <-', () {
    test('should return PersonEntity', () async {
      CustomLogger.loggerNoStack.i('-> getPersonById() <- test starting...');

      when(repository.getPersonById(id: testSuccessPersonEntity.id))
          .thenAnswer((_) async => Right(testSuccessPersonEntity));

      final result = await usecase
          .call(GetPersonByIdParams(personId: testSuccessPersonEntity.id));
      verify(repository.getPersonById(id: testSuccessPersonEntity.id))
          .called(1);
      expect(result, equals(Right(testSuccessPersonEntity)));
    });

    test('should return DB Failure', () async {
      CustomLogger.loggerNoStack.i('-> getPersonById() <- test starting...');
      when(repository.getPersonById(id: testFailurePersonEntity.id)).thenAnswer(
          (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
      final result = await usecase
          .call(GetPersonByIdParams(personId: testFailurePersonEntity.id));

      verify(repository.getPersonById(id: testFailurePersonEntity.id))
          .called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
