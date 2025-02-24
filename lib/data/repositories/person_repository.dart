import 'package:all_4_u/core/error/failure.dart';

import 'package:all_4_u/domain/entities/person_entity.dart';

import 'package:all_4_u/domain/entities/person_entity_list.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/error_messages.dart';
import '../../domain/repositories/person_repository_intf.dart';
import '../daos/person_dao_intf.dart';

@Injectable(as: PersonRepositoryInterface)
class PersonRepository implements PersonRepositoryInterface {
  final PersonDAOInterface personDAO;
  PersonRepository({required this.personDAO});

  @override
  Future<Either<Failure, int>> countPeople() async {
    final numberOfPeople = await personDAO.countAll();
    if (numberOfPeople == 0) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return Right(numberOfPeople);
    }
  }

  @override
  Future<Either<Failure, int>> createPerson({required final String firstName,
    required final String lastName}) {
    // TODO: implement createPerson
    throw UnimplementedError();
  }

  @override
  void deleteAllPeople() {
    // TODO: implement deleteAllPeople
  }

  @override
  void deletePerson(int id) {
    // TODO: implement deletePerson
  }

  @override
  Future<Either<Failure, PersonEntityList>> getAllPeople() {
    // TODO: implement getAllPeople
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PersonEntity>> getPersonById(int id) {
    // TODO: implement getPersonById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, PersonEntity>> updatePerson(
      int id, String firstName, String personLastName) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }
}
