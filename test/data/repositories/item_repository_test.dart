import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/item_repository.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/data/datasource/database/all4u_database_mock.mocks.dart';

//
void main() {
  final database = MockAll4UDatabase();
  final ItemRepository repository = ItemRepository(database: database);

  // test data
  final String successItemName = 'successItemName';
  final String failItemName = 'failItemName';
  final String testDescription = 'testDescription';
  final int testId = 17;
  final List<int> testCategoryIds = [7, 11, 14];
  final List<int> testPersonIds = [2, 3, 13, 17, 86];

  group('#insertItem', () {
    setUp(() {
      // insert full item
      when(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      )).thenAnswer(
        (_) async => {
          'id': testId,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      );

      // insert named item
      when(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': null,
          'categoryIds': null,
          'personIds': null,
        },
      )).thenAnswer(
        (_) async => {
          'id': testId,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      );

      // insert unassigned item
      when(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': null,
        },
      )).thenAnswer(
        (_) async => {
          'id': testId,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      );

      // insert uncategorized item
      when(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': null,
          'personIds': testPersonIds,
        },
      )).thenAnswer(
        (_) async => {
          'id': testId,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      );

      // common failure case
      when(database.insertItem(
        {
          'id': null,
          'name': failItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      )).thenAnswer(
        (_) async => {
          'id': null,
          'name': null,
          'description': null,
          'categoryIds': null,
          'personIds': null
        },
      );
    });

    test('insert full item: should return ItemEntity', () async {
      final ItemEntity successTestPersonEntity = ItemEntity(
          id: testId,
          name: successItemName,
          description: testDescription,
          categoryIdList: testCategoryIds,
          personIdList: testPersonIds);

      final result = await repository.insertFullItem(
          successItemName, testDescription, testCategoryIds, testPersonIds);

      verify(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      )).called(1);
      expect(result, equals(Right(successTestPersonEntity)));
    });

    test('insert named item: should return ItemEntity', () async {
      final ItemEntity successTestPersonEntity = ItemEntity(
          id: testId,
          name: successItemName,
          description: testDescription,
          categoryIdList: testCategoryIds,
          personIdList: testPersonIds);

      final result = await repository.insertNamedItem(successItemName);

      verify(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': null,
          'categoryIds': null,
          'personIds': null,
        },
      )).called(1);
      expect(result, equals(Right(successTestPersonEntity)));
    });

    test('insert uncategorized item: should return ItemEntity', () async {
      final ItemEntity successTestPersonEntity = ItemEntity(
          id: testId,
          name: successItemName,
          description: testDescription,
          categoryIdList: testCategoryIds,
          personIdList: testPersonIds);

      final result = await repository.insertUncategorizedItem(
          successItemName, testDescription, testPersonIds);

      verify(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': null,
          'personIds': testPersonIds,
        },
      )).called(1);
      expect(result, equals(Right(successTestPersonEntity)));
    });

    test('insert unassigned item: should return ItemEntity', () async {
      final ItemEntity successTestPersonEntity = ItemEntity(
          id: testId,
          name: successItemName,
          description: testDescription,
          categoryIdList: testCategoryIds,
          personIdList: testPersonIds);

      final result = await repository.insertUnassignedItem(
          successItemName, testDescription, testCategoryIds);

      verify(database.insertItem(
        {
          'id': null,
          'name': successItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': null,
        },
      )).called(1);
      expect(result, equals(Right(successTestPersonEntity)));
    });

    test('should return DB Failure', () async {
      final result = await repository.insertFullItem(
          failItemName, testDescription, testCategoryIds, testPersonIds);

      verify(database.insertItem(
        {
          'id': null,
          'name': failItemName,
          'description': testDescription,
          'categoryIds': testCategoryIds,
          'personIds': testPersonIds,
        },
      )).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
