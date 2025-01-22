import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/usecases/delete_all_people_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../mock/domain/repository/person_repository_mock.mocks.dart';

void main() {
  final PersonRepository repository = MockPersonRepository();
  final DeleteAllPeopleUsecase usecase = DeleteAllPeopleUsecase(repository);

  setUp(() {
    when(repository.deleteAllPeople())
        .thenAnswer((_) async => const Right(null));
  });

  test('should return void', () async {
    await usecase.call(NoParams());
    verify(repository.deleteAllPeople()).called(1);
  });
}
