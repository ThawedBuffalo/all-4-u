// import 'package:all_4_u/data/repositories/person_repository.dart';
// import 'package:all_4_u/domain/usecases/delete_person_by_id_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../mock/domain/repository/person_repository_mock.mocks.dart';
//
// void main() {
//   final PersonRepository repository = MockPersonRepository();
//   final DeletePersonByIdUsecase usecase = DeletePersonByIdUsecase(repository);
//
//   final int testPersonId = 1;
//
//   setUp(() {
//     when(repository.deletePersonById(testPersonId))
//         .thenAnswer((_) async => const Right(null));
//   });
//
//   test('should return void', () async {
//     await usecase.call(DeletePersonParams(personId: testPersonId));
//     verify(repository.deletePersonById(testPersonId)).called(1);
//   });
// }
