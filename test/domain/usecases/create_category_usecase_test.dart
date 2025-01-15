import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_id.dart';
import 'package:all_4_u/domain/usecases/create_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/domain/repository/category_repository_mock.mocks.dart';

void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final CreateCategoryUseCase usecase = CreateCategoryUseCase(repository);

  final testName = 'useCaseTestName';
  final testCategoryEntityId = CategoryEntityId(id: 71114);
  final testCategoryEntity = CategoryEntity(id: testCategoryEntityId, name: testName);

  setUp(() {
    when(repository.insertCategory(testName)).thenAnswer((_) async => Right(testCategoryEntity));
  });


  test('should return CategoryEntity', () async {
    final result = await usecase.call(Params(categoryName: testName));

    verify(repository.insertCategory(testName)).called(1);
    expect(result, equals(Right(testCategoryEntity)));
  });
}
