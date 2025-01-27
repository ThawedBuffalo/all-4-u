import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/item_repository.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:all_4_u/domain/usecases/create_category_usecase.dart';
import 'package:all_4_u/domain/usecases/create_full_item_usecase.dart';
import 'package:all_4_u/domain/usecases/create_unassigned_item_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/domain/repository/item_repository_mock.mocks.dart';

void main() {
  final ItemRepository repository = MockItemRepository();
  final CreateUnassignedItemUseCase usecase =
      CreateUnassignedItemUseCase(repository);

  // test data
  final String successItemName = 'successItemName';
  final String failItemName = 'failItemName';
  final String testDescription = 'testDescription';
  final int testId = 17;
  final List<int> testCategoryIds = [7, 11, 14];
  final ItemEntity successTestItemEntity = ItemEntity(
      id: testId,
      name: successItemName,
      description: testDescription,
      categoryIdList: testCategoryIds,
      personIdList: null);

  setUp(() {
    when(repository.insertUnassignedItem(
            successItemName, testDescription, testCategoryIds))
        .thenAnswer((_) async => Right(successTestItemEntity));
    when(repository.insertUnassignedItem(
            failItemName, testDescription, testCategoryIds))
        .thenAnswer(
            (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
  });

  test('should return ItemEntity', () async {
    final result = await usecase.call(CreateUnAssItemParams(
        name: successItemName,
        description: testDescription,
        categoryIds: testCategoryIds));

    verify(repository.insertUnassignedItem(
            successItemName, testDescription, testCategoryIds))
        .called(1);
    expect(result, equals(Right(successTestItemEntity)));
  });

  test('should return DB Failure', () async {
    final result = await usecase.call(CreateUnAssItemParams(
        name: failItemName,
        description: testDescription,
        categoryIds: testCategoryIds));

    verify(repository.insertUnassignedItem(
            failItemName, testDescription, testCategoryIds))
        .called(1);
    expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
  });
}
