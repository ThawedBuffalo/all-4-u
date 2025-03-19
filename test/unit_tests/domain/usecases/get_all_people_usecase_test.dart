import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:all_4_u/domain/usecases/get_all_people_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_person_dto_factory.dart';
import 'get_all_people_usecase_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  final PersonRepository repository = MockPersonRepository();
  final GetAllPeopleUsecase usecase = GetAllPeopleUsecase(repository);

  FakePersonDTOFactory personDTOFactory = FakePersonDTOFactory();
  List<PersonDTO> testPeopleDTOList =
      personDTOFactory.generateFakeList(length: 3);
  PersonEntityList testPeopleEntList =
      personDTOFactory.generateFakeEntityList(dtoList: testPeopleDTOList);

  group('-> getAllPeople() <-', () {
    test('should return PersonEntityList', () async {
      CustomLogger.loggerNoStack.i('-> getAllPeople() <- test starting...');
      when(repository.getAllPeople())
          .thenAnswer((_) async => Right(testPeopleEntList));
      final result = await usecase.call(NoParams());
      verify(repository.getAllPeople()).called(1);
      expect(result, equals(Right(testPeopleEntList)));
    });

    test('should return empty results failure', () async {
      CustomLogger.loggerNoStack.i('-> getAllPeople() <- test starting...');
      when(repository.getAllPeople()).thenAnswer((_) async =>
          Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE)));
      final result = await usecase.call(NoParams());
      //verify(repository.getAllPeople()).called(1);
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });
}
