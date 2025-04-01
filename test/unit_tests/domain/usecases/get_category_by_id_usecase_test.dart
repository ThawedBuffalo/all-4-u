import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/usecases/get_category_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_category_dto_factory.dart';
import 'get_category_by_id_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final GetCategoryByIdUseCase usecase = GetCategoryByIdUseCase(repository);

  FakeCategoryDTOFactory categoryDTOFactory = FakeCategoryDTOFactory();
  CategoryDTO testSuccessCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testSuccessCategoryEntity =
  categoryDTOFactory.generateFakeEntity(testSuccessCategoryDTO);

  CategoryDTO testFailureCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testFailureCategoryEntity =
  categoryDTOFactory.generateFakeEntity(testFailureCategoryDTO);

  group('-> getCategoryById() <-', () {

    test('should return CategoryEntity', () async {
      when(repository.getCategoryById(id: testSuccessCategoryDTO.id))
          .thenAnswer((_) async => Right(testSuccessCategoryEntity));
      final result = await usecase.call(Params(categoryId: testSuccessCategoryDTO.id));
      verify(repository.getCategoryById(
          id: testSuccessCategoryDTO.id)).called(1);
      expect(result, equals(Right(testSuccessCategoryEntity)));
    });

    test('should return NO CategoryEntity', () async {
      when(repository.getCategoryById(
          id: testFailureCategoryEntity.id)).thenAnswer(
              (_) async => Left(DBEmptyResult(
              errorMessage: DB_EMPTY_RESULTS_FAILURE)));
      final result = await usecase.call(Params(
          categoryId: testFailureCategoryDTO.id));
      expect(result, equals(Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE))));
    });
  });
}
