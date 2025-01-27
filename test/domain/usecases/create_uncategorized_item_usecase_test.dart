import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/repositories/item_repository.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:all_4_u/domain/usecases/create_uncategorized__item_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/domain/repository/item_repository_mock.mocks.dart';

void main() {
  final ItemRepository repository = MockItemRepository();
  final CreateUncategorizedItemUseCase usecase =
      CreateUncategorizedItemUseCase(repository);

  // test data
  final String successItemName = 'successItemName';
  final String failItemName = 'failItemName';
  final String testDescription = 'testDescription';
  final int testId = 17;
  final List<int> testPersonIds = [2, 3, 13, 17, 86];
  final ItemEntity successTestItemEntity = ItemEntity(
      id: testId,
      name: successItemName,
      description: testDescription,
      categoryIdList: null,
      personIdList: testPersonIds);

  setUp(() {
    when(repository.insertUncategorizedItem(
            successItemName, testDescription, testPersonIds))
        .thenAnswer((_) async => Right(successTestItemEntity));
    when(repository.insertUncategorizedItem(
            failItemName, testDescription, testPersonIds))
        .thenAnswer(
            (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
  });

  test('should return ItemEntity', () async {
    final result = await usecase.call(CreateUnCatItemParams(
        name: successItemName,
        description: testDescription,
        personIds: testPersonIds));

    verify(repository.insertUncategorizedItem(
            successItemName, testDescription, testPersonIds))
        .called(1);
    expect(result, equals(Right(successTestItemEntity)));
  });

  test('should return DB Failure', () async {
    final result = await usecase.call(CreateUnCatItemParams(
        name: failItemName,
        description: testDescription,
        personIds: testPersonIds));

    verify(repository.insertUncategorizedItem(
            failItemName, testDescription, testPersonIds))
        .called(1);
    expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
  });
}
