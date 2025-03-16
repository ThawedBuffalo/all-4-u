import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/usecases/create_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_category_dto_factory.dart';
import 'create_category_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  var mockRepository = MockCategoryRepository();
  final CreateCategoryUseCase usecase = CreateCategoryUseCase(mockRepository);

  FakeCategoryDTOFactory categoryDTOFactory = FakeCategoryDTOFactory();
  CategoryDTO testSuccessCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testSuccessCategoryEntity =
      categoryDTOFactory.generateFakeEntity(testSuccessCategoryDTO);

  CategoryDTO testFailureCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testFailureCategoryEntity =
      categoryDTOFactory.generateFakeEntity(testFailureCategoryDTO);

  group('-> createCategory() <-', () {
    test('should return ID', () async {
      CustomLogger.loggerNoStack.i('-> createCategory() <- test starting...');
      when(mockRepository.createCategory(category: anyNamed('category')))
          .thenAnswer((_) async => Right(testSuccessCategoryDTO.id));

      final result = await usecase
          .call(Params(categoryName: testSuccessCategoryEntity.name));
      expect(result, equals(Right(testSuccessCategoryDTO.id)));
    });

    test('should return DB Failure', () async {
      CustomLogger.loggerNoStack.i('-> createCategory() <- test starting...');
      when(mockRepository.createCategory(category: anyNamed('category')))
          .thenAnswer(
              (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
      final result = await usecase
          .call(Params(categoryName: testFailureCategoryEntity.name));
      // verify(mockRepository.createCategory(category: testFailureCategoryEntity))
      //     .called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
