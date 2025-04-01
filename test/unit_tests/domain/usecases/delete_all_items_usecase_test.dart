import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/repositories/item_repository.dart';
import 'package:all_4_u/domain/usecases/delete_all_items_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'delete_all_items_usecase_test.mocks.dart';

@GenerateMocks([ItemRepository])
void main() {
  final ItemRepository repository = MockItemRepository();
  final DeleteAllItemsUsecase usecase = DeleteAllItemsUsecase(repository);

  setUp(() {
    when(repository.deleteAllItems())
        .thenAnswer((_) async => const Right(null));
  });

  test('should return void', () async {
    await usecase.call(NoParams());
    verify(repository.deleteAllItems()).called(1);
  });
}
