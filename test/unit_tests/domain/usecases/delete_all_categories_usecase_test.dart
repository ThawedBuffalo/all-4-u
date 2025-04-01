import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/usecases/delete_all_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'delete_all_categories_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  final CategoryRepository repository = MockCategoryRepository();
  final DeleteAllCategoriesUsecase usecase =
      DeleteAllCategoriesUsecase(repository);

  setUp(() {
    when(repository.deleteAllCategories())
        .thenAnswer((_) async => const Right(null));
  });

  test('should return void', () async {
    await usecase.call(NoParams());
    verify(repository.deleteAllCategories()).called(1);
  });
}
