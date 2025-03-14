import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/usecases/get_all_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'create_category_usecase_test.mocks.dart';

void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final GetAllCategoriesUsecase usecase = GetAllCategoriesUsecase(repository);

  final int entity1Id = 1;
  final String entity1Name = 'testEntity1';
  final CategoryEntity entity1 =
      CategoryEntity(id: entity1Id, name: entity1Name);

  final int entity2Id = 2;
  final String entity2Name = 'testEntity2';
  final CategoryEntity entity2 =
      CategoryEntity(id: entity2Id, name: entity2Name);

  final int entity3Id = 3;
  final String entity3Name = 'testEntity3';
  final CategoryEntity entity3 =
      CategoryEntity(id: entity3Id, name: entity3Name);

  List<CategoryEntity> testEntityListInput = [entity1, entity2, entity3];
  CategoryEntityList testCategoryEntityList =
      CategoryEntityList(values: testEntityListInput);

  when(repository.getAllCategories())
      .thenAnswer((_) async => Right(testCategoryEntityList));

  test('should return CategoryEntityList', () async {
    final result = await usecase.call(NoParams());

    verify(repository.getAllCategories()).called(1);
    expect(result, equals(Right(testCategoryEntityList)));
  });
}
