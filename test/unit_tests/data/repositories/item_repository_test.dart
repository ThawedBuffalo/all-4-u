import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/daos/item_dao.dart';
import 'package:all_4_u/data/dtos/item_dto.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/data/repositories/item_repository.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:all_4_u/domain/entities/item_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_item_dto_factory.dart';
import '../../../helpers/Fake_person_dto_factory.dart';

import 'item_repository_test.mocks.dart';

@GenerateMocks([ItemDAO])
void main() {
  late ItemRepository repo;
  var mockDAO = MockItemDAO();
  FakeItemDTOFactory itemDTOFactory;
  ItemDTO testItemDTO;
  List<ItemDTO> testItemDTOSingleList;
  List<ItemDTO> testItemDTOMultiList;
  ItemEntity testItemEntity;
  ItemEntityList testItemEntityList;

  CustomLogger.logger.i('ItemRepository test setting up...');

  /// set up repo with mock
  repo = ItemRepository(itemDAO: mockDAO);

  /// setup test itemDTOs
  itemDTOFactory = FakeItemDTOFactory();
  testItemDTO = itemDTOFactory.generateFake();
  testItemDTOMultiList = itemDTOFactory.generateFakeList(length: 3);
  testItemDTOSingleList = itemDTOFactory.generateFakeList(length: 1);
  testItemEntityList =
      itemDTOFactory.generateFakeEntityList(dtoList: testItemDTOMultiList);
  testItemEntity = itemDTOFactory.generateFakeEntity(testItemDTO);

  group('-> countItems() <-', () {
    test('expect count', () async {
      CustomLogger.loggerNoStack.i('-> countItems() <- test starting...');
      final int testCount = 3;
      when(mockDAO.countAll()).thenAnswer((_) async => testCount);
      final result = await repo.countItems();
      expect(result, equals(Right(testCount)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> countItems() <- test starting...');
      final int testCount = 0;
      when(mockDAO.countAll()).thenAnswer((_) async => testCount);
      final result = await repo.countItems();
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });
/*
  group('-> create items <-', () {
    test('createFullItem(): expect ID returned', () async {
      CustomLogger.loggerNoStack.i('-> createFullItem() <- test starting...');
      when(mockDAO.insert(item: testItemDTO))
          .thenAnswer((_) async => Right(testItemDTO.id));
      final result = await repo.createFullItem(name: testItemDTO.name, description: ,
          categoryIds:  ,personIds: );
      expect(result, equals(Right(testItemDTO.id)));
    });

    test('expect db failure', () async {
      CustomLogger.loggerNoStack.i('-> createFullItem() <- test starting...');
      final int testCount = 0;
      final String testErrMessage = 'insert failed for duplicate name';
      when(mockDAO.insert(person: anyNamed('person')))
          .thenAnswer((_) async => Left(testErrMessage));
      final result = await repo.createFullItem();
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
      final int testCount = 0;
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
      expect(1,1);
    });

    test('deleteAllPeople()', () async {
      CustomLogger.loggerNoStack
          .i('-> deleteAllPeople() <- test starting...');
      // no return to test, adding stub for code coverage, force success
      repo.deleteAllPeople();
      expect(1, 1);
    });
  });
*/
}
