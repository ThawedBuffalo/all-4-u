// import 'package:all_4_u/core/error/error_messages.dart';
// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/data/repositories/item_repository.dart';
// import 'package:all_4_u/domain/entities/item_entity.dart';
// import 'package:all_4_u/domain/usecases/create_named_item_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../mock/domain/repository/item_repository_mock.mocks.dart';
//
// void main() {
//   final ItemRepository repository = MockItemRepository();
//   final CreateNamedItemUseCase usecase = CreateNamedItemUseCase(repository);
//
//   // test data
//   final String successItemName = 'successItemName';
//   final String failItemName = 'failItemName';
//   final int testId = 17;
//   final ItemEntity successTestItemEntity = ItemEntity(
//       id: testId,
//       name: successItemName,
//       description: null,
//       categoryIdList: null,
//       personIdList: null);
//
//   setUp(() {
//     when(repository.insertNamedItem(successItemName))
//         .thenAnswer((_) async => Right(successTestItemEntity));
//     when(repository.insertNamedItem(failItemName)).thenAnswer(
//         (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//   });
//
//   test('should return ItemEntity', () async {
//     final result =
//         await usecase.call(CreateNamedItemParams(name: successItemName));
//
//     verify(repository.insertNamedItem(successItemName)).called(1);
//     expect(result, equals(Right(successTestItemEntity)));
//   });
//
//   test('should return DB Failure', () async {
//     final result =
//         await usecase.call(CreateNamedItemParams(name: failItemName));
//
//     verify(repository.insertNamedItem(failItemName)).called(1);
//     expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
//   });
// }
