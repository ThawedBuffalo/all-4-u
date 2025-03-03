import 'package:dartz/dartz.dart';

import '../dtos/person_dto.dart';

abstract class PersonDAOInterface {
  Future<List<PersonDTO>> findOne({required int personId});
  Future<List<PersonDTO>> findAll();
  Future<Either<String, int>> insert({required PersonDTO person});
  Future<void> delete({required int personId});
  Future<void> deleteAll();
  Future<int> countAll();
}
