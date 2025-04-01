import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/usecases/update_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../helpers/Fake_category_dto_factory.dart';
import 'update_category_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  final CategoryRepository mockRepository = MockCategoryRepository();
  final UpdateCategoryUseCase usecase = UpdateCategoryUseCase(mockRepository);

  FakeCategoryDTOFactory categoryDTOFactory = FakeCategoryDTOFactory();
  CategoryDTO testSuccessCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testSuccessCategoryEntity =
      categoryDTOFactory.generateFakeEntity(testSuccessCategoryDTO);

  CategoryDTO testFailureCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testFailureCategoryEntity =
      categoryDTOFactory.generateFakeEntity(testFailureCategoryDTO);

  group('-> updateCategory() <-', () {
    test('should return updated ID', () async {
      CustomLogger.loggerNoStack.i('-> updateCategory() <- test starting...');
      when(mockRepository.updateCategory(category: testSuccessCategoryEntity))
          .thenAnswer((_) async => Right(testSuccessCategoryDTO.id));

      final result = await usecase.call(UpdateCategoryParams(
          categoryId: testSuccessCategoryDTO.id,
          categoryName: testSuccessCategoryDTO.name));

      expect(result, equals(Right(testSuccessCategoryDTO.id)));
    });

    test('should return DB Failure', () async {
      CustomLogger.loggerNoStack.i('-> updateCategory() <- test starting...');
      when(mockRepository.updateCategory(category: testFailureCategoryEntity))
          .thenAnswer(
              (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));

      final result = await usecase.call(UpdateCategoryParams(
          categoryId: testFailureCategoryEntity.id,
          categoryName: testFailureCategoryEntity.name));

      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
