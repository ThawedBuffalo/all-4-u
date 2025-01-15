import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/data/datasource/database/all4u_database_mock.mocks.dart';

//
void main() {
  final database = MockAll4UDatabase();
  final CategoryRepository repository = CategoryRepository(database: database);

  // test data
  final int testId = 7;
  final String testName = 'testName';

  group('#createCategory- su', () {
    setUp(() {
      when(database.insertCategory(
        {'id': null, 'name': 'testName'},
      )).thenAnswer(
        (_) async => {'id': testId, 'name': testName},
      );
    });

    test('should return CategoryEntity', () async {
      final CategoryEntity testCategoryEntity =
          CategoryEntity(id: testId, name: testName);

      final result = await repository.insertCategory('testName');

      verify(database.insertCategory(
        {'id': null, 'name': testName},
      )).called(1);

      expect(result, equals(Right(testCategoryEntity)));
    });
  });
}
//
//   group('#updateTodo', () {
//     setUp(() {
//       when(database.updateTodo(
//         {
//           'id': 1,
//           'title': 'new title',
//           'description': 'new description',
//           'is_completed': 1,
//           'due_date': date.toIso8601String(),
//         },
//       )).thenAnswer((_) async => {});
//     });
//
//     test('should return void', () async {
//       await repository.updateTodo(const TodoId(value: 1), 'new title', 'new description', true, date);
//       verify(database.updateTodo(
//         {
//           'id': 1,
//           'title': 'new title',
//           'description': 'new description',
//           'is_completed': 1,
//           'due_date': date.toIso8601String(),
//         },
//       )).called(1);
//     });
//   });
//
//   group('#deleteTodo', () {
//     setUp(() {
//       when(database.deleteTodo(1)).thenAnswer((_) async => {});
//     });
//
//     test('should return void', () async {
//       await repository.deleteTodo(const TodoId(value: 1));
//       verify(database.deleteTodo(1)).called(1);
//     });
//   });
// }
