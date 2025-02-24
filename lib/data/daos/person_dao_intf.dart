import 'package:dartz/dartz.dart';

import '../dtos/person_dto.dart';

abstract class PersonDAOInterface {
  Future<List<PersonDTO>> findOne(int personId);
  Future<List<PersonDTO>> findAll();
  Future<Either<String, int>> insert(PersonDTO person);
  Future<void> delete(int personId);
  void deleteAll();
  Future<int> countAll();
}
