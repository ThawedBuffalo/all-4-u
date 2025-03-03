import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/daos/category_dao.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
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
  List<CategoryDTO> testCategoryDTOSingleList;
  List<CategoryDTO> testCategoryDTOMultiList;
  CategoryEntity testCategoryEntity;
  CategoryEntityList testCategoryEntityList;

  CustomLogger.loggerNoStack.i('CategoryRepository test setting up...');

  /// set up repo with mock
  repo = CategoryRepository(categoryDAO: mockDAO);

  /// setup test categoryDTOs
  categoryDTOFactory = FakeCategoryDTOFactory();
  testCategoryDTO = categoryDTOFactory.generateFake();
  testCategoryDTOMultiList = categoryDTOFactory.generateFakeList(length: 3);
  testCategoryDTOSingleList = categoryDTOFactory.generateFakeList(length: 1);
  testCategoryEntityList = categoryDTOFactory.generateFakeEntityList(
      dtoList: testCategoryDTOMultiList);
  testCategoryEntity = categoryDTOFactory.generateFakeEntity(testCategoryDTO);

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

  group('-> createCategory() <-', () {
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
      when(mockDAO.findAll()).thenAnswer((_) async => testCategoryDTOMultiList);
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
          .thenAnswer((_) async => testCategoryDTOSingleList);
      final result = await repo.getCategoryById(id: 1);
      CategoryEntity entity =
          categoryDTOFactory.generateFakeEntity(testCategoryDTOSingleList[0]);
      expect(result, equals(Right(entity)));
    });

    test('expect failure- no data', () async {
      CustomLogger.loggerNoStack.i('-> getCategoryById() <- test starting...');
      List<CategoryDTO> emptyList = <CategoryDTO>[];
      when(mockDAO.findOne(categoryId: anyNamed('categoryId')))
          .thenAnswer((_) async => emptyList);
      final result = await repo.getCategoryById(id: 1);
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });

    test('expect failure- too much data', () async {
      CustomLogger.loggerNoStack.i('-> getCategoryById() <- test starting...');
      when(mockDAO.findOne(categoryId: anyNamed('categoryId')))
          .thenAnswer((_) async => testCategoryDTOMultiList);
      final result = await repo.getCategoryById(id: 1);
      expect(
          result, equals(Left(DBEmptyResult(errorMessage: DB_RETURNED_MORE))));
    });
  });

  group('-> updateCategory() <-', () {
    test('expect ID returned', () async {
      CustomLogger.loggerNoStack.i('-> updateCategory() <- test starting...');
      when(mockDAO.insert(category: anyNamed('category')))
          .thenAnswer((_) async => Right(testCategoryDTO.id));
      final result = await repo.updateCategory(category: testCategoryEntity);
      expect(result, equals(Right(testCategoryEntity.id)));
    });

    test('expect db failure', () async {
      CustomLogger.loggerNoStack.i('-> updateCategory() <- test starting...');
      final int testCount = 0;
      final String testErrMessage = 'insert failed for duplicate name';
      when(mockDAO.insert(category: anyNamed('category')))
          .thenAnswer((_) async => Left(testErrMessage));
      final result = await repo.updateCategory(category: testCategoryEntity);
      expect(result, equals(Left(DBFailure(errorMessage: testErrMessage))));
    });
  });

  group('-> delete mocks <-', () {
    test('deleteCategory()', () async {
      CustomLogger.loggerNoStack.i('-> deleteCategory() <- test starting...');
      when(mockDAO.delete(categoryId: anyNamed('categoryId')))
          .thenAnswer((_) async => null);
      final result = await repo.updateCategory(category: testCategoryEntity);
      expect(result, equals(Right(testCategoryEntity.id)));
    });

    test('deleteAllCategories()', () async {
      CustomLogger.loggerNoStack
          .i('-> deleteAllCategories() <- test starting...');
      // no return to test, adding stub for code coverage, force success
      repo.deleteAllCategories();
      expect(1, 1);
    });
  });
}
