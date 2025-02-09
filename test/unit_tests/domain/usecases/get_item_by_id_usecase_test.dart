// import 'package:all_4_u/core/error/error_messages.dart';
// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/data/repositories/category_repository.dart';
// import 'package:all_4_u/data/repositories/item_repository.dart';
// import 'package:all_4_u/domain/entities/category_entity.dart';
// import 'package:all_4_u/domain/entities/item_entity.dart';
// import 'package:all_4_u/domain/usecases/get_category_by_id_usecase.dart';
// import 'package:all_4_u/domain/usecases/get_item_by_id_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../mock/domain/repository/category_repository_mock.mocks.dart';
// import '../../mock/domain/repository/item_repository_mock.mocks.dart';
//
// void main() {
//   final ItemRepository repository = MockItemRepository();
//   final GetItemByIdUseCase usecase = GetItemByIdUseCase(repository);
//
//   final String successItemName = 'successItemName';
//   final String failItemName = 'failItemName';
//   final String testDescription = 'testDescription';
//   final int testId = 17;
//   final List<int> testCategoryIds = [7, 11, 14];
//   final List<int> testPersonIds = [2, 3, 13, 17, 86];
//   final ItemEntity successTestItemEntity = ItemEntity(
//       id: testId,
//       name: successItemName,
//       description: testDescription,
//       categoryIdList: testCategoryIds,
//       personIdList: testPersonIds);
//
//   setUp(() {
//     when(repository.getItemById(testId))
//         .thenAnswer((_) async => Right(successTestItemEntity));
//     when(repository.getCategoryById(failCategoryId)).thenAnswer(
//         (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//   });
//
//   test('should return CategoryEntity', () async {
//     final result = await usecase.call(Params(categoryId: successCategoryId));
//
//     verify(repository.getCategoryById(successCategoryId)).called(1);
//     expect(result, equals(Right(testCategoryEntity)));
//   });
//
//   test('should return DB Failure', () async {
//     final result = await usecase.call(Params(categoryId: failCategoryId));
//
//     verify(repository.getCategoryById(failCategoryId)).called(1);
//     expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
//   });
// }
