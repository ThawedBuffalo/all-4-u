import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/usecases/delete_person_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'delete_person_by_id_usecase_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  final PersonRepository repository = MockPersonRepository();
  final DeletePersonByIdUsecase usecase = DeletePersonByIdUsecase(repository);

  final int testPersonId = 1;
  group('-> deletePersonById() <-', () {
    test('should return void', () async {
      CustomLogger.loggerNoStack.i('-> deletePersonById() <- test starting...');
      when(repository.deletePersonById(id: testPersonId))
          .thenAnswer((_) async => const Right(null));
      await usecase.call(DeletePersonParams(personId: testPersonId));
      verify(repository.deletePersonById(id: testPersonId)).called(1);
    });
  });
}
