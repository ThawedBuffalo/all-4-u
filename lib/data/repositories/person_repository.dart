import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/helpers/EitherX.dart';

import 'package:all_4_u/domain/entities/person_entity.dart';

import 'package:all_4_u/domain/entities/person_entity_list.dart';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/error/error_messages.dart';
import '../../domain/repositories/person_repository_intf.dart';
import '../daos/person_dao_intf.dart';
import '../dtos/person_dto.dart';
import '../mapper/person_entity_mapper.dart';

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
  Future<Either<Failure, int>> createPerson(
      {required final String firstName, required final String lastName}) async {
    // must set ID to 0 for DB to autoincrement
    PersonDTO person =
        PersonDTO(id: 0, firstName: firstName, lastName: lastName);
    final result = await personDAO.insert(person);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
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
  Future<Either<Failure, PersonEntity>> getPersonById(
      {required final int id}) async {
    final List<PersonDTO> personDTOList = await personDAO.findOne(id);

    if (personDTOList.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      if (personDTOList.length > 1) {
        return Left(DBEmptyResult(errorMessage: DB_RETURNED_MORE));
      } else {
        return Right(PersonEntityMapper.transformDTOToEntity(personDTOList[0]));
      }
    }
  }

  @override
  Future<Either<Failure, PersonEntity>> updatePerson(
      int id, String firstName, String personLastName) {
    // TODO: implement updatePerson
    throw UnimplementedError();
  }
}
