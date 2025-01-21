import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
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
}
