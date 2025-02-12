// import 'package:all_4_u/core/error/error_messages.dart';
// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/data/repositories/category_repository.dart';
// import 'package:all_4_u/domain/entities/category.dart';
// import 'package:all_4_u/domain/usecases/create_category_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../mock/domain/repository/category_repository_mock.mocks.dart';
//
// void main() {
//   final CategoryRepository repository = MockCategoryRepository();
//   final CreateCategoryUseCase usecase = CreateCategoryUseCase(repository);
//
//   final String successTestName = 'successUseCaseTestName';
//   final String failTestName = 'failedUseCaseTestName';
//   final int testCategoryId = 71114;
//   final CategoryEntity testCategoryEntity =
//       CategoryEntity(id: testCategoryId, name: successTestName);
//
//   setUp(() {
//     when(repository.insertCategory(successTestName))
//         .thenAnswer((_) async => Right(testCategoryEntity));
//     when(repository.insertCategory(failTestName)).thenAnswer(
//         (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//   });
//
//   test('should return CategoryEntity', () async {
//     final result = await usecase.call(Params(categoryName: successTestName));
//
//     verify(repository.insertCategory(successTestName)).called(1);
//     expect(result, equals(Right(testCategoryEntity)));
//   });
//
//   test('should return DB Failure', () async {
//     final result = await usecase.call(Params(categoryName: failTestName));
//
//     verify(repository.insertCategory(failTestName)).called(1);
//     expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
//   });
// }
