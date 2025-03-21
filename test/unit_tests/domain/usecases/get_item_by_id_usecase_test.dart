import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/dtos/item_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/data/repositories/item_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:all_4_u/domain/usecases/get_category_by_id_usecase.dart';
import 'package:all_4_u/domain/usecases/get_item_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_item_dto_factory.dart';
import 'get_item_by_id_usecase_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  final ItemRepository repository = MockItemRepository();
  final GetItemByIdUseCase usecase = GetItemByIdUseCase(repository);

  FakeItemDTOFactory itemDTOFactory = FakeItemDTOFactory();
  ItemDTO testSuccessItemDTO = itemDTOFactory.generateFake();
  ItemEntity testSuccessItemEntity =
      itemDTOFactory.generateFakeEntity(testSuccessItemDTO);
  ItemDTO testFailureItemDTO = itemDTOFactory.generateFake();
  ItemEntity testFailureItemEntity =
      itemDTOFactory.generateFakeEntity(testFailureItemDTO);

  group('-> getItemById() <-', () {
    test('should return ItemEntity', () async {
      CustomLogger.loggerNoStack.i('-> getItemById() <- test starting...');

      when(repository.getItemById(id: testSuccessItemEntity.id))
          .thenAnswer((_) async => Right(testSuccessItemEntity));

      final result = await usecase
          .call(GetItemByIdParams(itemId: testSuccessItemEntity.id));

      verify(repository.getItemById(id: testSuccessItemEntity.id)).called(1);
      expect(result, equals(Right(testSuccessItemEntity)));
    });

    test('should return DB Failure', () async {
      CustomLogger.loggerNoStack.i('-> getItemById() <- test starting...');

      when(repository.getItemById(id: testFailureItemEntity.id)).thenAnswer(
          (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));

      final result = await usecase
          .call(GetItemByIdParams(itemId: testFailureItemEntity.id));

      verify(repository.getItemById(id: testFailureItemEntity.id)).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
