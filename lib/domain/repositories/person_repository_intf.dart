import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/person_entity.dart';
import '../entities/person_entity_list.dart';

abstract class PersonRepositoryInterface {
  Future<Either<Failure, PersonEntity>> insertPerson(final String firstName, String personLastName);
  Future<Either<Failure, PersonEntity>> getPersonById(final int id);
  Future<Either<Failure, PersonEntityList>> getAllPeople();
  Future<Either<Failure, PersonEntity>> updatePerson(
      final int id, final String firstName, String personLastName);
  Future<void> deletePersonById(final int id);
  Future<void> deleteAllPeople();
}
