import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:all_4_u/data/repositories/person_repository.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/usecases/create_person_usecase.dart';
import 'package:all_4_u/domain/usecases/create_person_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import '../../../helpers/Fake_category_dto_factory.dart';
import 'create_person_usecase_test.mocks.dart';

@GenerateMocks([CategoryRepository])
void main() {
  final PersonRepository repository = MockPersonRepository();
  final CreatePersonUseCase usecase = CreatePersonUseCase(repository);

  FakeCategoryDTOFactory categoryDTOFactory = FakeCategoryDTOFactory();
  CategoryDTO testSuccessCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testSuccessCategoryEntity =
  categoryDTOFactory.generateFakeEntity(testSuccessCategoryDTO);

  CategoryDTO testFailureCategoryDTO = categoryDTOFactory.generateFake();
  CategoryEntity testFailureCategoryEntity =
  categoryDTOFactory.generateFakeEntity(testFailureCategoryDTO);

  group('-> createPerson() <-', () {


      when(repository.insertPerson(failTestFirstName, successTestLastName))
          .thenAnswer(
              (_) async => Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));


    test('should return PersonEntity', () async {
      when(repository.)
          .thenAnswer((_) async => Right(testPersonEntity));
      final result = await usecase.call(
          CreatePersonParams(personFirstName: successTestFirstName,
              personLastName: successTestLastName));

      verify(repository.insertPerson(successTestFirstName, successTestLastName))
          .called(1);
      expect(result, equals(Right(testPersonEntity)));
    });

    test('should return DB Failure', () async {
      final result = await usecase.call(
          CreatePersonParams(personFirstName: failTestFirstName,
              personLastName: successTestLastName));
      verify(repository.insertPerson(failTestFirstName, successTestLastName))
          .called(1);
      expect(result, equals(Left(DBFailure(errorMessage: DB_INSERT_FAILURE))));
    });
  });
}
