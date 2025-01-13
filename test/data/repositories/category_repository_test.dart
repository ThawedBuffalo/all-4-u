// import 'package:all_4_u/data/repositories/category_repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
//
// void main() {
//   final database = MockTodosDatabase();
//   final CategoryRepository repository = ;
//   final date = DateTime.now();
//
//   group('#', () {
//     setUp(() {
//       when(database.allTodos()).thenAnswer((_) async => [
//         {
//           'id': 1,
//           'title': 'title',
//           'description': 'description',
//           'is_completed': 0,
//           'due_date': date.toIso8601String(),
//         },
//       ]);
//     });
//
//     test('should return TodoList', () async {
//       final actual = await repository.getTodoList();
//       final expected = TodoList(
//         values: [
//           Todo(
//             id: const TodoId(value: 1),
//             title: 'title',
//             description: 'description',
//             isCompleted: false,
//             dueDate: date,
//           ),
//         ],
//       );
//       expect(actual.values.first.id, expected.values.first.id);
//       verify(database.allTodos()).called(1);
//     });
//   });
//
//   group('#createTodo', () {
//     setUp(() {
//       when(database.insertTodo(
//         {
//           'id': null,
//           'title': 'title',
//           'description': 'description',
//           'is_completed': 0,
//           'due_date': date.toIso8601String(),
//         },
//       )).thenAnswer(
//             (_) async => {
//           'id': 1,
//           'title': 'title',
//           'description': 'description',
//           'is_completed': 0,
//           'due_date': date.toIso8601String(),
//         },
//       );
//     });
//
//     test('should return void', () async {
//       await repository.createTodo('title', 'description', false, date);
//       verify(database.insertTodo(
//         {
//           'id': null,
//           'title': 'title',
//           'description': 'description',
//           'is_completed': 0,
//           'due_date': date.toIso8601String(),
//         },
//       )).called(1);
//     });
//   });
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
