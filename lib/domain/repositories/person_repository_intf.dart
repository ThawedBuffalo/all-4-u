import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/person_entity.dart';
import '../entities/person_entity_list.dart';

abstract class PersonRepositoryInterface {
  Future<Either<Failure, int>> countPeople();
  Future<Either<Failure, int>> createPerson(
      {required final String firstName, required final String lastName});
  Future<Either<Failure, PersonEntity>> getPersonById({required final int id});
  Future<Either<Failure, PersonEntityList>> getAllPeople();
  Future<Either<Failure, PersonEntity>> updatePerson(
      final int id, final String firstName, String personLastName);
  void deletePerson(final int id);
  void deleteAllPeople();
}
