import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/usecases/delete_category_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'delete_category_by_id_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final DeleteCategoryByIdUsecase usecase =
      DeleteCategoryByIdUsecase(repository);

  final int testCategoryId = 1;

  setUp(() {
    when(repository.deleteCategoryById(categoryId: testCategoryId))
        .thenAnswer((_) async => const Right(null));
  });

  test('should return void', () async {
    await usecase.call(DelParams(categoryId: testCategoryId));
    verify(repository.deleteCategoryById(categoryId: testCategoryId)).called(1);
  });
}
