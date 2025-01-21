import 'package:dartz/dartz.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/person_entity.dart';
import '../../domain/entities/person_entity_list.dart';
import '../../domain/repositories/person_repository_intf.dart';
import '../datasources/database/all4u_database.dart';
import '../mapper/person_entity_list_mapper.dart';
import '../mapper/person_entity_mapper.dart';
import '../models/person_model.dart';

class PersonRepository implements PersonRepositoryInterface {
  final All4UDatabase database;

  const PersonRepository({required this.database});

  @override
  Future<Either<Failure, PersonEntity>> insertPerson(
      final String firstName, final String lastName) async {
    final PersonModel personModel = await database.insertPerson(
        PersonEntityMapper.transformToNewModelMap(firstName, lastName));
    if (personModel['id'] == null) {
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return (Right(PersonEntityMapper.transformModelToEntity(personModel)));
    }
  }

  @override
  Future<Either<Failure, PersonEntity>> getPersonById(int id) async {
    final PersonModel personModel = await database.getPersonById(id);

    return (Right(PersonEntityMapper.transformModelToEntity(personModel)));
  }

  @override
  Future<Either<Failure, PersonEntityList>> getAllPeople() async {
    final PersonModelList modelList = await database.getAllPeople();
    return (Right(PersonEntityListMapper.transformModelToEntity(modelList)));
  }

  @override
  Future<void> deletePersonById(final int id) async =>
      await database.deletePersonById(id);

  @override
  Future<void> deleteAllPeople() async {
    await database.deleteAllPeople();
  }

  @override
  Future<Either<Failure, PersonEntity>> updatePerson(
      int id, String personFirstName, String personLastName) async {
    final PersonModel personModel = await database.updatePerson(
        PersonEntityMapper.transformToModelMap(
            id, personFirstName, personLastName));
    if (personModel['id'] == null) {
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    } else {
      return (Right(PersonEntityMapper.transformModelToEntity(personModel)));
    }
  }
}
