import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/usecases/create_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'create_category_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final CreateCategoryUseCase usecase = CreateCategoryUseCase(repository);

  final String successTestName = 'successUseCaseTestName';
  final String failTestName = 'failedUseCaseTestName';
  final int testCategoryId = 71114;

  group('-> createCategory() <-', () {
    setUp(() {
      when(repository.createCategory(category: any))
          .thenAnswer((_) async => Right(testCategoryId));
      when(repository.createCategory(category: null)).thenAnswer(
          (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    });

    test('should return CategoryEntity', () async {
      CustomLogger.loggerNoStack.i('-> createCategory() <- test starting...');
      final result = await usecase.call(Params(categoryName: successTestName));
      verify(repository.createCategory(name: successTestName)).called(1);
      expect(result, equals(Right(testCategoryId)));
    });

    test('should return DB Failure', () async {
      CustomLogger.loggerNoStack.i('-> createCategory() <- test starting...');
      final result = await usecase.call(Params(categoryName: failTestName));
      verify(repository.createCategory(name: failTestName)).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
