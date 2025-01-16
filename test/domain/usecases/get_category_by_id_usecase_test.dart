import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/usecases/get_category_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/domain/repository/category_repository_mock.mocks.dart';

void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final GetCategoryByIdUseCase usecase = GetCategoryByIdUseCase(repository);

  final String successTestName = 'successUseCaseTestName';
  final int successCategoryId = 71114;
  final int failCategoryId = 1;
  final CategoryEntity testCategoryEntity =
      CategoryEntity(id: successCategoryId, name: successTestName);

  setUp(() {
    when(repository.getCategoryById(successCategoryId))
        .thenAnswer((_) async => Right(testCategoryEntity));
    when(repository.getCategoryById(failCategoryId)).thenAnswer(
        (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
  });

  test('should return CategoryEntity', () async {
    final result = await usecase.call(Params(categoryId: successCategoryId));

    verify(repository.getCategoryById(successCategoryId)).called(1);
    expect(result, equals(Right(testCategoryEntity)));
  });

  test('should return DB Failure', () async {
    final result = await usecase.call(Params(categoryId: failCategoryId));

    verify(repository.getCategoryById(failCategoryId)).called(1);
    expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
  });
}
