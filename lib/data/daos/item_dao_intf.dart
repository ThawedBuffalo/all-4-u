import 'package:dartz/dartz.dart';

import '../dtos/person_dto.dart';

abstract class ItemDAOInterface {
  Future<List<ItemDTO>> findOne({required int personId});
  Future<List<ItemDTO>> findAll();
  Future<Either<String, int>> insert({required ItemDTO item});
  Future<void> delete({required int personId});
  void deleteAll();
  Future<int> countAll();
}
