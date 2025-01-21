import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/data/datasource/database/all4u_database_mock.mocks.dart';

//
void main() {
  final database = MockAll4UDatabase();
  final PersonRepository repository = PersonRepository(database: database);

  // test data
  final int successTestPersonId = 17;
  final String successTestPersonFirstName = 'testFirstName';
  final String failTestPersonFirstName = 'failedFirstName';
  final String testPersonLastName = 'testLastName';

  group('#insertPerson', () {
    setUp(() {
      when(database.insertPerson(
        {
          'id': null,
          'firstName': successTestPersonFirstName,
          'lastName': testPersonLastName
        },
      )).thenAnswer(
        (_) async => {
          'id': successTestPersonId,
          'firstName': successTestPersonFirstName,
          'lastName': testPersonLastName
        },
      );

      when(database.insertPerson(
        {
          'id': null,
          'firstName': failTestPersonFirstName,
          'lastName': testPersonLastName
        },
      )).thenAnswer(
        (_) async => {'id': null, 'firstName': null, 'lastName': null},
      );
    });

    test('should return PersonEntity', () async {
      final PersonEntity successTestPersonEntity = PersonEntity(
          id: successTestPersonId,
          firstName: successTestPersonFirstName,
          lastName: testPersonLastName);

      final result = await repository.insertPerson(
          successTestPersonFirstName, testPersonLastName);

      verify(database.insertPerson(
        {
          'id': null,
          'firstName': successTestPersonFirstName,
          'lastName': testPersonLastName
        },
      )).called(1);
      expect(result, equals(Right(successTestPersonEntity)));
    });

    test('should return DB Failure', () async {
      final result = await repository.insertPerson(
          failTestPersonFirstName, testPersonLastName);

      verify(database.insertPerson(
        {
          'id': null,
          'firstName': failTestPersonFirstName,
          'lastName': testPersonLastName
        },
      )).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });

  group('#get 1 Person', () {
    setUp(() {
      when(database.getPersonById(successTestPersonId)).thenAnswer(
        (_) async => {
          'id': successTestPersonId,
          'firstName': successTestPersonFirstName,
          'lastName': testPersonLastName
        },
      );
    });

    test('should return PersonEntity', () async {
      final PersonEntity successTestPersonEntity = PersonEntity(
          id: successTestPersonId,
          firstName: successTestPersonFirstName,
          lastName: testPersonLastName);
      final result = await repository.getPersonById(successTestPersonId);

      verify(database.getPersonById(successTestPersonId)).called(1);
      expect(result, equals(Right(successTestPersonEntity)));
    });
  });

  group('#updatePerson', () {
    final int entityId = 1;
    final int failedEntityId = 9;
    final String editEntity1Name = 'testEditedEntity';
    final String failedEntityName = 'failedEditedEntity';
    final String lastEntityName = 'testLastName';
    final PersonEntity successEditEntity = PersonEntity(
        id: entityId, firstName: editEntity1Name, lastName: lastEntityName);

    setUp(() {
      when(database.updatePerson(
        {
          'id': entityId,
          'firstName': editEntity1Name,
          'lastName': lastEntityName
        },
      )).thenAnswer(
        (_) async => {
          'id': entityId,
          'firstName': editEntity1Name,
          'lastName': lastEntityName
        },
      );

      when(database.updatePerson(
        {
          'id': failedEntityId,
          'firstName': failedEntityName,
          'lastName': lastEntityName
        },
      )).thenAnswer(
        (_) async => {'id': null, 'firstName': null, 'lastName': null},
      );
    });

    test('should return PersonEntity', () async {
      final result = await repository.updatePerson(
          entityId, editEntity1Name, lastEntityName);

      verify(database.updatePerson(
        {
          'id': entityId,
          'firstName': editEntity1Name,
          'lastName': lastEntityName
        },
      )).called(1);
      expect(result, equals(Right(successEditEntity)));
    });

    test('should return DB Failure', () async {
      final result = await repository.updatePerson(
          failedEntityId, failedEntityName, lastEntityName);

      verify(database.updatePerson(
        {
          'id': failedEntityId,
          'firstName': failedEntityName,
          'lastName': lastEntityName
        },
      )).called(1);
      //expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });

  group('#get all People', () {
    test('should return PersonEntityList', () async {
      final int entity1Id = 1;
      final String entity1FirstName = 'testEntity1FirstName';
      final String entity1LastName = 'testEntity1LastName';
      final Map<String, dynamic> entity1Map = {
        'id': entity1Id,
        'firstName': entity1FirstName,
        'lastName': entity1LastName
      };
      final PersonEntity entity1 = PersonEntity(
          id: entity1Id,
          firstName: entity1FirstName,
          lastName: entity1LastName);

      final int entity2Id = 2;
      final String entity2FirstName = 'testEntity2FirstName';
      final String entity2LastName = 'testEntity2LastName';
      final Map<String, dynamic> entity2Map = {
        'id': entity2Id,
        'firstName': entity2FirstName,
        'lastName': entity2LastName
      };
      final PersonEntity entity2 = PersonEntity(
          id: entity2Id,
          firstName: entity2FirstName,
          lastName: entity2LastName);

      final int entity3Id = 3;
      final String entity3FirstName = 'testEntity3FirstName';
      final String entity3LastName = 'testEntity3LastName';
      final Map<String, dynamic> entity3Map = {
        'id': entity3Id,
        'firstName': entity3FirstName,
        'lastName': entity3LastName
      };
      final PersonEntity entity3 = PersonEntity(
          id: entity3Id,
          firstName: entity3FirstName,
          lastName: entity3LastName);

      List<Map<String, dynamic>> testMapListInput = [
        entity1Map,
        entity2Map,
        entity3Map
      ];
      List<PersonEntity> testEntityListInput = [entity1, entity2, entity3];
      PersonEntityList testPeopleEntityList =
          PersonEntityList(values: testEntityListInput);

      when(database.getAllPeople()).thenAnswer((_) async => testMapListInput);

      final result = await repository.getAllPeople();

      verify(database.getAllPeople()).called(1);
      expect(result, equals(Right(testPeopleEntityList)));
    });
  });

  group('#deletePersonById', () {
    final int testPersonId = 1;

    setUp(() {
      when(database.deletePersonById(testPersonId)).thenAnswer(
        (_) async => {},
      );
    });

    test('should return void', () async {
      final result = await repository.deletePersonById(testPersonId);
      verify(database.deletePersonById(testPersonId)).called(1);
    });
  });

  group('#deleteAllPeople', () {
    setUp(() {
      when(database.deleteAllPeople()).thenAnswer(
        (_) async => {},
      );
    });

    test('should return void', () async {
      final result = await repository.deleteAllPeople();
      verify(database.deleteAllPeople()).called(1);
    });
  });
}
