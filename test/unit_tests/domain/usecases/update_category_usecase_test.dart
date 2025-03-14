import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/usecases/update_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/domain/repository/category_repository_mock.mocks.dart';

void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final UpdateCategoryUseCase usecase = UpdateCategoryUseCase(repository);

  final String successTestName = 'successUseCaseTestName';
  final String failTestName = 'failedUseCaseTestName';
  final int testCategoryId = 71114;
  final CategoryEntity testCategoryEntity =
      CategoryEntity(id: testCategoryId, name: successTestName);

  setUp(() {
    when(repository.updateCategory(testCategoryId, successTestName))
        .thenAnswer((_) async => Right(testCategoryEntity));
    when(repository.updateCategory(testCategoryId, failTestName)).thenAnswer(
        (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
  });

  test('should return CategoryEntity', () async {
    final result = await usecase.call(UpdateCategoryParams(
        categoryId: testCategoryId, categoryName: successTestName));

    verify(repository.updateCategory(testCategoryId, successTestName))
        .called(1);
    expect(result, equals(Right(testCategoryEntity)));
  });

  test('should return DB Failure', () async {
    final result = await usecase.call(UpdateCategoryParams(
        categoryId: testCategoryId, categoryName: failTestName));

    verify(repository.updateCategory(testCategoryId, failTestName)).called(1);
    expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
  });
}
