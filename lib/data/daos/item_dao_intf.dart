import 'package:dartz/dartz.dart';

import '../dtos/item_dto.dart';
import '../dtos/person_dto.dart';

abstract class ItemDAOInterface {
  Future<List<ItemDTO>> findOne({required int itemId});
  Future<List<ItemDTO>> findAll();
  Future<Either<String, int>> insert({required ItemDTO item});
  Future<void> delete({required int itemId});
  Future<void> deleteAll();
  Future<int> countAll();
}
