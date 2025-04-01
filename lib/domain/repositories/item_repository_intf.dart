import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/item_entity.dart';
import '../entities/item_entity_list.dart';

abstract class ItemRepositoryInterface {
  Future<Either<Failure, int>> createFullItem(
      {required final String name,
      String? description,
      CategoryEntityList? categoryEntityList,
      PersonEntityList? personEntityList});
  Future<Either<Failure, int>> createUnassignedItem({required final String name,
      String? description, CategoryEntityList? categoryEntityList});
  Future<Either<Failure, int>> createUncategorizedItem({
    required final String name, String? description, PersonEntityList? personEntityList});
  Future<Either<Failure, int>> createNamedItem({required final String name});
  Future<Either<Failure, int>> countItems();
  Future<Either<Failure, ItemEntity>> getItemById({required final int id});
  Future<Either<Failure, ItemEntityList>> getAllItems();
  Future<Either<Failure, int>> updateItem({required ItemEntity item});
  Future<void> deleteItemById({required final int id});
  Future<void> deleteAllItems();
}
