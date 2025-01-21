import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/data/datasource/database/all4u_database_mock.mocks.dart';

//
void main() {
  final database = MockAll4UDatabase();
  final CategoryRepository repository = CategoryRepository(database: database);

  // test data
  final int testId = 7;
  final String successTestName = 'successTestName';
  final String failTestName = 'failedTestName';

  group('#insertCategory', () {
    setUp(() {
      when(database.insertCategory(
        {'id': null, 'name': successTestName},
      )).thenAnswer(
        (_) async => {'id': testId, 'name': successTestName},
      );

      when(database.insertCategory(
        {'id': null, 'name': failTestName},
      )).thenAnswer(
        (_) async => {'id': null, 'name': null},
      );
    });

    test('should return CategoryEntity', () async {
      final CategoryEntity successTestCategoryEntity =
          CategoryEntity(id: testId, name: successTestName);

      final result = await repository.insertCategory(successTestName);

      verify(database.insertCategory(
        {'id': null, 'name': successTestName},
      )).called(1);
      expect(result, equals(Right(successTestCategoryEntity)));
    });

    test('should return DB Failure', () async {
      final result = await repository.insertCategory(failTestName);

      verify(database.insertCategory(
        {'id': null, 'name': failTestName},
      )).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });

  group('#get 1 Category', () {
    final int successCategoryId = 1;
    final String successCategoryName = 'successCategoryName';

    setUp(() {
      when(database.getCategoryById(successCategoryId)).thenAnswer(
        (_) async => {'id': successCategoryId, 'name': successCategoryName},
      );
    });

    test('should return CategoryEntity', () async {
      final CategoryEntity successTestCategoryEntity =
          CategoryEntity(id: successCategoryId, name: successCategoryName);

      final result = await repository.getCategoryById(successCategoryId);

      verify(database.getCategoryById(successCategoryId)).called(1);
      expect(result, equals(Right(successTestCategoryEntity)));
    });
  });

  group('#get all Categories', () {
    test('should return CategoryEntityList', () async {
      final int entity1Id = 1;
      final String entity1Name = 'testEntity1';
      final Map<String, dynamic> entity1Map = {
        'id': entity1Id,
        'name': entity1Name
      };
      final CategoryEntity entity1 =
          CategoryEntity(id: entity1Id, name: entity1Name);

      final int entity2Id = 2;
      final String entity2Name = 'testEntity2';
      final Map<String, dynamic> entity2Map = {
        'id': entity2Id,
        'name': entity2Name
      };
      final CategoryEntity entity2 =
          CategoryEntity(id: entity2Id, name: entity2Name);

      final int entity3Id = 3;
      final String entity3Name = 'testEntity3';
      final Map<String, dynamic> entity3Map = {
        'id': entity3Id,
        'name': entity3Name
      };
      final CategoryEntity entity3 =
          CategoryEntity(id: entity3Id, name: entity3Name);

      List<Map<String, dynamic>> testMapListInput = [
        entity1Map,
        entity2Map,
        entity3Map
      ];
      List<CategoryEntity> testEntityListInput = [entity1, entity2, entity3];
      CategoryEntityList testCategoryEntityList =
          CategoryEntityList(values: testEntityListInput);

      when(database.getAllCategories())
          .thenAnswer((_) async => testMapListInput);

      final result = await repository.getAllCategories();

      verify(database.getAllCategories()).called(1);
      expect(result, equals(Right(testCategoryEntityList)));
    });
  });

  group('#deleteCategoryById', () {
    final int testCategoryId = 1;

    setUp(() {
      when(database.deleteCategoryById(testCategoryId)).thenAnswer(
        (_) async => {},
      );
    });

    test('should return void', () async {
      final result = await repository.deleteCategoryById(testCategoryId);
      verify(database.deleteCategoryById(testCategoryId)).called(1);
    });
  });

  group('#deleteAllCategories', () {
    setUp(() {
      when(database.deleteAllCategories()).thenAnswer(
        (_) async => {},
      );
    });

    test('should return void', () async {
      final int testCategoryId = 1;
      final result = await repository.deleteAllCategories();

      verify(database.deleteAllCategories()).called(1);
    });
  });

  group('#updateCategory', () {
    final int entity1Id = 1;
    final String editEntity1Name = 'testEditedEntity1';
    final String failedEntityName = 'failedEditedEntity1';
    final CategoryEntity successEditEntity =
        CategoryEntity(id: entity1Id, name: editEntity1Name);

    setUp(() {
      when(database.updateCategory(
        {'id': entity1Id, 'name': editEntity1Name},
      )).thenAnswer(
        (_) async => {'id': entity1Id, 'name': editEntity1Name},
      );

      when(database.updateCategory(
        {'id': entity1Id, 'name': failedEntityName},
      )).thenAnswer(
        (_) async => {'id': null, 'name': null},
      );
    });

    test('should return CategoryEntity', () async {
      final result =
          await repository.updateCategory(entity1Id, editEntity1Name);

      verify(database.updateCategory(
        {'id': entity1Id, 'name': editEntity1Name},
      )).called(1);
      expect(result, equals(Right(successEditEntity)));
    });

    test('should return DB Failure', () async {
      final result =
          await repository.updateCategory(entity1Id, failedEntityName);

      verify(database.updateCategory(
        {'id': entity1Id, 'name': failedEntityName},
      )).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
