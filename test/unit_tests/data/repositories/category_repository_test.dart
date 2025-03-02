import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/daos/category_dao.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_category_dto_factory.dart';
import 'category_repository_test.mocks.dart';

@GenerateMocks([CategoryDAO])
void main() {
  late CategoryRepository repo;
  var mockDAO = MockCategoryDAO();
  FakeCategoryDTOFactory categoryDTOFactory;
  CategoryDTO testCategoryDTO;
  List<CategoryDTO> testCategoryDTOList;
  CategoryEntityList testCategoryEntity;
  CategoryEntityList testCategoryEntityList;

  CustomLogger.loggerNoStack.i('CategoryDAO test setting up...');

  /// set up repo with mock
  repo = CategoryRepository(categoryDAO: mockDAO);

  /// setup test categoryDTOs
  categoryDTOFactory = FakeCategoryDTOFactory();
  testCategoryDTO = categoryDTOFactory.generateFake();
  testCategoryDTOList = categoryDTOFactory.generateFakeList(length: 3);
  testCategoryEntityList =
      categoryDTOFactory.generateFakeEntityList(dtoList: testCategoryDTOList);

  group('-> countCategories() <-', () {
    test('expect count', () async {
      CustomLogger.loggerNoStack.i('-> countCategories() <- test starting...');
      final int testCount = 3;
      when(mockDAO.countAll()).thenAnswer((_) async => testCount);
      final result = await repo.countCategories();
      expect(result, equals(Right(testCount)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> countCategories() <- test starting...');
      final int testCount = 0;
      when(mockDAO.countAll()).thenAnswer((_) async => testCount);
      final result = await repo.countCategories();
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });

  group('-> getAllCategories() <-', () {
    test('expect ID returned', () async {
      CustomLogger.loggerNoStack.i('-> createCategories() <- test starting...');
      when(mockDAO.insert(category: anyNamed('category')))
          .thenAnswer((_) async => Right(testCategoryDTO.id));
      final result = await repo.createCategory(name: 'testName');
      expect(result, equals(Right(testCategoryDTO.id)));
    });

    test('expect db failure', () async {
      CustomLogger.loggerNoStack.i('-> createCategories() <- test starting...');
      final int testCount = 0;
      final String testErrMessage = 'insert failed for duplicate name';
      when(mockDAO.insert(category: anyNamed('category')))
          .thenAnswer((_) async => Left(testErrMessage));
      final result = await repo.createCategory(name: 'testName');
      expect(result, equals(Left(DBFailure(errorMessage: testErrMessage))));
    });
  });

  group('-> getAllCategories() <-', () {
    test('expect CategoryEntityList', () async {
      CustomLogger.loggerNoStack.i('-> getAllCategories() <- test starting...');
      when(mockDAO.findAll()).thenAnswer((_) async => testCategoryDTOList);
      final result = await repo.getAllCategories();
      expect(result, equals(Right(testCategoryEntityList)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> getAllCategories() <- test starting...');
      List<CategoryDTO> emptyList = <CategoryDTO>[];
      when(mockDAO.findAll()).thenAnswer((_) async => emptyList);
      final result = await repo.getAllCategories();
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });

  group('-> getCategoryById() <-', () {
    test('expect CategoryEntity', () async {
      CustomLogger.loggerNoStack.i('-> getCategoryById() <- test starting...');
      when(mockDAO.findOne(categoryId: anyNamed('categoryId')))
      .thenAnswer((_) async => Right(testCategoryDTO));
      final result = await repo.getAllCategories();
      expect(result, equals(Right(testCategoryEntityList)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> getCategoryById() <- test starting...');
      List<CategoryDTO> emptyList = <CategoryDTO>[];
      when(mockDAO.findOne()).thenAnswer((_) async => emptyList);
      final result = await repo.getAllCategories();
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });
}

// group('Category', () {
//   final int successCategoryId = 1;
//   final int emptyCategoryId = 7;
//   final String successCategoryName = 'successCategoryName';
//
//   setUp(() {
//     when(database.categoryDAO.getCategoryById(successCategoryId)).thenAnswer(
//       (_) async => {'id': successCategoryId, 'name': successCategoryName},
//     );
//
//     when(database..categoryDAO.getCategoryById(emptyCategoryId)).thenAnswer(
//       (_) async => {},
//     );
//   });
//
//   test('should return 1 CategoryEntity', () async {
//     final CategoryEntity successTestCategoryEntity =
//         CategoryEntity(id: successCategoryId, name: successCategoryName);
//
//     final result = await repository.getCategoryById(successCategoryId);
//
//     verify(database..categoryDAO.getCategoryById(successCategoryId))
//         .called(1);
//     expect(result, equals(Right(successTestCategoryEntity)));
//   });
//
//   test('should return empty results failure', () async {
//     final result = await repository.getCategoryById(emptyCategoryId);
//
//     verify(database.categoryDAO.getCategoryById(emptyCategoryId)).called(1);
//     expect(result,
//         equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
//   });
// });
//
// group('#get all Categories', () {
//   test('should return CategoryEntityList', () async {
//     final int entity1Id = 1;
//     final String entity1Name = 'testEntity1';
//     final Map<String, dynamic> entity1Map = {
//       'id': entity1Id,
//       'name': entity1Name
//     };
//     final CategoryEntity entity1 =
//         CategoryEntity(id: entity1Id, name: entity1Name);
//
//     final int entity2Id = 2;
//     final String entity2Name = 'testEntity2';
//     final Map<String, dynamic> entity2Map = {
//       'id': entity2Id,
//       'name': entity2Name
//     };
//     final CategoryEntity entity2 =
//         CategoryEntity(id: entity2Id, name: entity2Name);
//
//     final int entity3Id = 3;
//     final String entity3Name = 'testEntity3';
//     final Map<String, dynamic> entity3Map = {
//       'id': entity3Id,
//       'name': entity3Name
//     };
//     final CategoryEntity entity3 =
//         CategoryEntity(id: entity3Id, name: entity3Name);
//
//     List<Map<String, dynamic>> testMapListInput = [
//       entity1Map,
//       entity2Map,
//       entity3Map
//     ];
//     List<CategoryEntity> testEntityListInput = [entity1, entity2, entity3];
//     CategoryEntityList testCategoryEntityList =
//         CategoryEntityList(values: testEntityListInput);
//
//     when(database.categoryDAO.getAllCategories())
//         .thenAnswer((_) async => testMapListInput);
//
//     final result = await repository.getAllCategories();
//
//     verify(database.categoryDAO.getAllCategories()).called(1);
//     expect(result, equals(Right(testCategoryEntityList)));
//   });
//
//   test('should return empty results failure', () async {
//     when(database.categoryDAO.getAllCategories()).thenAnswer(
//       (_) async => {null},
//     );
//
//     final result = await repository.getAllCategories();
//
//     verify(database.categoryDAO.getAllCategories()).called(1);
//     expect(result,
//         equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
//   });
// });
//
// group('#delete Category', () {
//   final int successCategoryId = 1;
//   final String successCategoryName = 'successCategoryName';
//   final int failedTestCategoryId = 7;
//
//   final CategoryEntity successTestCategoryEntity =
//       CategoryEntity(id: successCategoryId, name: successCategoryName);
//
//   setUp(() {
//     when(database.categoryDAO.deleteCategoryById(failedTestCategoryId))
//         .thenAnswer(
//       (_) async => {},
//     );
//     when(database.categoryDAO.deleteCategoryById(successCategoryId))
//         .thenAnswer(
//       (_) async => {},
//     );
//   });
//
//   test('should return void', () async {
//     final result = await repository.deleteCategoryById(testCategoryId);
//     verify(database.deleteCategoryById(testCategoryId)).called(1);
//   });
// });
//
// group('#deleteAllCategories', () {
//   setUp(() {
//     when(database.deleteAllCategories()).thenAnswer(
//       (_) async => {},
//     );
//   });
//
//   test('should return void', () async {
//     final int testCategoryId = 1;
//     final result = await repository.deleteAllCategories();
//
//     verify(database.deleteAllCategories()).called(1);
//   });
// });
//
// group('#updateCategory', () {
//   final int entity1Id = 1;
//   final String editEntity1Name = 'testEditedEntity1';
//   final String failedEntityName = 'failedEditedEntity1';
//   final CategoryEntity successEditEntity =
//       CategoryEntity(id: entity1Id, name: editEntity1Name);
//
//   setUp(() {
//     when(database.updateCategory(
//       {'id': entity1Id, 'name': editEntity1Name},
//     )).thenAnswer(
//       (_) async => {'id': entity1Id, 'name': editEntity1Name},
//     );
//
//     when(database.updateCategory(
//       {'id': entity1Id, 'name': failedEntityName},
//     )).thenAnswer(
//       (_) async => {'id': null, 'name': null},
//     );
//   });
//
//   test('should return CategoryEntity', () async {
//     final result =
//         await repository.updateCategory(entity1Id, editEntity1Name);
//
//     verify(database.updateCategory(
//       {'id': entity1Id, 'name': editEntity1Name},
//     )).called(1);
//     expect(result, equals(Right(successEditEntity)));
//   });
//
//   test('should return DB Failure', () async {
//     final result =
//         await repository.updateCategory(entity1Id, failedEntityName);
//
//     verify(database.updateCategory(
//       {'id': entity1Id, 'name': failedEntityName},
//     )).called(1);
//     expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
//   });
// });
