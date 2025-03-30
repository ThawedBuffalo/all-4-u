import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/dtos/item_dto.dart';
import 'package:all_4_u/data/repositories/item_repository.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:all_4_u/domain/usecases/create_unassigned_item_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_item_dto_factory.dart';

import 'create_unassigned_item_usecase_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  final ItemRepository repository = MockItemRepository();
  final CreateUnassignedItemUseCase usecase =
      CreateUnassignedItemUseCase(repository);

  FakeItemDTOFactory itemDTOFactory = FakeItemDTOFactory();
  ItemDTO testItemDTO = itemDTOFactory.generateFake();
  ItemEntity testItemEntity = itemDTOFactory.generateFakeEntity(testItemDTO);

  group('-> createUnassignedItem() <-', () {
    test('should return ItemEntity', () async {
      CustomLogger.loggerNoStack
          .i('-> createUnassignedItem() <- test starting...');

      when(repository.createUnassignedItem(
              name: testItemEntity.name,
              description: testItemEntity.description,
              categoryEntityList: testItemEntity.categoryList))
          .thenAnswer((_) async => Right(testItemEntity.id));

      final result = await usecase.call(CreateUnAssItemParams(
          name: testItemEntity.name,
          description: testItemEntity.description,
          categories: testItemEntity.categoryList));

      verify(repository.createFullItem(
              name: testItemEntity.name,
              description: testItemEntity.description,
              categoryEntityList: testItemEntity.categoryList))
          .called(1);
      expect(result, equals(Right(testItemEntity.id)));
    });

    test('should return DB Failure', () async {
      CustomLogger.loggerNoStack
          .i('-> createUnassignedItem() <- test starting...');

      when(repository.createUnassignedItem(
              name: testItemEntity.name,
              description: testItemEntity.description,
              categoryEntityList: testItemEntity.categoryList))
          .thenAnswer(
              (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));

      final result = await usecase.call(CreateUnAssItemParams(
          name: testItemEntity.name,
          description: testItemEntity.description,
          categories: testItemEntity.categoryList));

      verify(repository.createFullItem(
              name: testItemEntity.name,
              description: testItemEntity.description,
              categoryEntityList: testItemEntity.categoryList))
          .called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
