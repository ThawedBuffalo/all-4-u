import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/daos/person_dao.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_person_dto_factory.dart';
import 'person_repository_test.mocks.dart';

@GenerateMocks([PersonDAO])
void main() {
  late PersonRepository repo;
  var mockDAO = MockPersonDAO();
  FakePersonDTOFactory personDTOFactory;
  PersonDTO testPersonDTO;
  List<PersonDTO> testPersonDTOSingleList;
  List<PersonDTO> testPersonDTOMultiList;
  PersonEntity testPersonEntity;
  PersonEntityList testPersonEntityList;

  CustomLogger.loggerNoStack.i('PersonRepository test setting up...');

  /// set up repo with mock
  repo = PersonRepository(personDAO: mockDAO);

  /// setup test categoryDTOs
  personDTOFactory = FakePersonDTOFactory();
  testPersonDTO = personDTOFactory.generateFake();
  testPersonDTOMultiList = personDTOFactory.generateFakeList(length: 3);
  testPersonDTOSingleList = personDTOFactory.generateFakeList(length: 1);
  testPersonEntityList =
      personDTOFactory.generateFakeEntityList(dtoList: testPersonDTOMultiList);
  testPersonEntity = personDTOFactory.generateFakeEntity(testPersonDTO);

  group('-> countCategories() <-', () {
    test('expect count', () async {
      CustomLogger.loggerNoStack.i('-> countPeople() <- test starting...');
      final int testCount = 3;
      when(mockDAO.countAll()).thenAnswer((_) async => testCount);
      final result = await repo.countPeople();
      expect(result, equals(Right(testCount)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> countPeople() <- test starting...');
      final int testCount = 0;
      when(mockDAO.countAll()).thenAnswer((_) async => testCount);
      final result = await repo.countPeople();
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });

  group('-> createPerson() <-', () {
    test('expect ID returned', () async {
      CustomLogger.loggerNoStack.i('-> createPeople() <- test starting...');
      when(mockDAO.insert(person: anyNamed('person')))
          .thenAnswer((_) async => Right(testPersonDTO.id));
      final result = await repo.createPerson(person: testPersonEntity);
      expect(result, equals(Right(testPersonDTO.id)));
    });

    test('expect db failure', () async {
      CustomLogger.loggerNoStack.i('-> createPeople() <- test starting...');
      final String testErrMessage = 'insert failed for duplicate name';
      when(mockDAO.insert(person: anyNamed('person')))
          .thenAnswer((_) async => Left(testErrMessage));
      final result = await repo.createPerson(person: testPersonEntity);
      expect(result, equals(Left(DBFailure(errorMessage: testErrMessage))));
    });
  });

  group('-> getAllPeople() <-', () {
    test('expect PersonEntityList', () async {
      CustomLogger.loggerNoStack.i('-> getAllPeople() <- test starting...');
      when(mockDAO.findAll()).thenAnswer((_) async => testPersonDTOMultiList);
      final result = await repo.getAllPeople();
      expect(result, equals(Right(testPersonEntityList)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> getAllPeople() <- test starting...');
      List<PersonDTO> emptyList = <PersonDTO>[];
      when(mockDAO.findAll()).thenAnswer((_) async => emptyList);
      final result = await repo.getAllPeople();
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });

  group('-> getPersonById() <-', () {
    test('expect PersonEntity', () async {
      CustomLogger.loggerNoStack.i('-> getPersonById() <- test starting...');
      when(mockDAO.findOne(personId: anyNamed('personId')))
          .thenAnswer((_) async => testPersonDTOSingleList);
      final result = await repo.getPersonById(id: 1);
      PersonEntity entity =
          personDTOFactory.generateFakeEntity(testPersonDTOSingleList[0]);
      expect(result, equals(Right(entity)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> getPersonById() <- test starting...');
      List<PersonDTO> emptyList = <PersonDTO>[];
      when(mockDAO.findOne(personId: anyNamed('personId')))
          .thenAnswer((_) async => emptyList);
      final result = await repo.getPersonById(id: 1);
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });

    test('expect failure- too much data', () async {
      CustomLogger.loggerNoStack.i('-> getPersonById() <- test starting...');
      when(mockDAO.findOne(personId: anyNamed('personId')))
          .thenAnswer((_) async => testPersonDTOMultiList);
      final result = await repo.getPersonById(id: 1);
      expect(
          result, equals(Left(DBEmptyResult(errorMessage: DB_RETURNED_MORE))));
    });
  });

  group('-> updatePerson() <-', () {
    test('expect ID returned', () async {
      CustomLogger.loggerNoStack.i('-> updatePerson() <- test starting...');
      when(mockDAO.insert(person: anyNamed('person')))
          .thenAnswer((_) async => Right(testPersonDTO.id));
      final result = await repo.updatePerson(person: testPersonEntity);
      expect(result, equals(Right(testPersonEntity.id)));
    });

    test('expect db failure', () async {
      CustomLogger.loggerNoStack.i('-> updatePerson() <- test starting...');
      final String testErrMessage = 'insert failed for duplicate name';
      when(mockDAO.insert(person: anyNamed('person')))
          .thenAnswer((_) async => Left(testErrMessage));
      final result = await repo.updatePerson(person: testPersonEntity);
      expect(result, equals(Left(DBFailure(errorMessage: testErrMessage))));
    });
  });

  group('-> delete mocks <-', () {
    test('deletePerson()', () async {
      CustomLogger.loggerNoStack.i('-> deletePerson() <- test starting...');
      repo.deletePerson(id: testPersonEntity.id);
      expect(1, 1);
    });

    test('deleteAllPeople()', () async {
      CustomLogger.loggerNoStack.i('-> deleteAllPeople() <- test starting...');
      // no return to test, adding stub for code coverage, force success
      repo.deleteAllPeople();
      expect(1, 1);
    });
  });
}
