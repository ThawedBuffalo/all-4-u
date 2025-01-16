import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
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
  final String successTestName = 'successTestName';
  final String failTestName = 'failedTestName';

  group('#insertCategory', () {
    setUp(() {
      when(database.insertCategory(
        {'id': null, 'name': successTestName},
      )).thenAnswer(
        (_) async => {'id': testId, 'name': successTestName},
      );

      when(database.insertCategory(
        {'id': null, 'name': failTestName},
      )).thenAnswer(
        (_) async => {'id': null, 'name': null},
      );
    });

    test('should return CategoryEntity', () async {
      final CategoryEntity successTestCategoryEntity =
          CategoryEntity(id: testId, name: successTestName);

      final result = await repository.insertCategory(successTestName);

      verify(database.insertCategory(
        {'id': null, 'name': successTestName},
      )).called(1);
      expect(result, equals(Right(successTestCategoryEntity)));
    });

    test('should return DB Failure', () async {
      final result = await repository.insertCategory(failTestName);

      verify(database.insertCategory(
        {'id': null, 'name': failTestName},
      )).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });



  group('#get 1 Category', () {

    final int successCategoryId = 1;
    final String successCategoryName = 'successCategoryName';
    final int failCategoryId = 9;

    setUp(() {
      when(database.getCategoryById(successCategoryId)).thenAnswer(
            (_) async => {'id': successCategoryId, 'name': successCategoryName},
      );

      when(database.getCategoryById(failCategoryId)).thenAnswer(
            (_) async => {'id': null, 'name': null},
      );
    });

    test('should return CategoryEntity', () async {
      final CategoryEntity successTestCategoryEntity =
      CategoryEntity(id: successCategoryId, name: successCategoryName);

      final result = await repository.getCategoryById(successCategoryId);

      verify(database.getCategoryById(successCategoryId)).called(1);
      expect(result, equals(Right(successTestCategoryEntity)));
    });

    test('should return DB Failure', () async {

      final result = await repository.getCategoryById(failCategoryId);

      verify(database.getCategoryById(failCategoryId)).called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
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
