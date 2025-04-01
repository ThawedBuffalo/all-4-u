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
import '../mapper/person_entity_list_mapper.dart';
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
      {required final PersonEntity person}) async {
    final result = await personDAO.insert(
        person: PersonEntityMapper.transformEntityToDTO(person));
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }

  @override
  void deleteAllPeople() {
    personDAO.deleteAll();
  }

  @override
  void deletePersonById({required int id}) {
    personDAO.delete(personId: id);
  }

  @override
  Future<Either<Failure, PersonEntityList>> getAllPeople() async {
    final List<PersonDTO> personDTOList = await personDAO.findAll();

    if (personDTOList.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return Right(
          PersonEntityListMapper.transformDTOListToEntityList(personDTOList));
    }
  }

  @override
  Future<Either<Failure, PersonEntity>> getPersonById(
      {required final int id}) async {
    final List<PersonDTO> personDTOList = await personDAO.findOne(personId: id);

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
  Future<Either<Failure, int>> updatePerson(
      {required final PersonEntity person}) async {
    final result = await personDAO.insert(
        person: PersonEntityMapper.transformEntityToDTO(person));
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }
}
