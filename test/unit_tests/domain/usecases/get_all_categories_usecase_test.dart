import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/usecases/get_all_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_category_dto_factory.dart';
import 'get_all_categories_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final GetAllCategoriesUsecase usecase = GetAllCategoriesUsecase(repository);

  FakeCategoryDTOFactory categoryDTOFactory = FakeCategoryDTOFactory();
  List<CategoryDTO> testCategoryDTOList =
      categoryDTOFactory.generateFakeList(length: 3);
  CategoryEntityList testCategoryEntList =
      categoryDTOFactory.generateFakeEntityList(dtoList: testCategoryDTOList);

  group('-> getAllCategories() <-', () {
    test('should return CategoryEntityList', () async {
      CustomLogger.loggerNoStack.i('-> getAllCategories() <- test starting...');
      when(repository.getAllCategories())
          .thenAnswer((_) async => Right(testCategoryEntList));
      final result = await usecase.call(NoParams());
      verify(repository.getAllCategories()).called(1);
      expect(result, equals(Right(testCategoryEntList)));
    });

    test('should return empty results failure', () async {
      CustomLogger.loggerNoStack.i('-> getAllCategories() <- test starting...');
      when(repository.getAllCategories()).thenAnswer((_) async =>
          Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE)));
      final result = await usecase.call(NoParams());
      verify(repository.getAllCategories()).called(1);
      expect(result,
          equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });
}
