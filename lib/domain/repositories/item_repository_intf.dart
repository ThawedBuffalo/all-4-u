import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/item_entity.dart';
import '../entities/item_entity_list.dart';

abstract class ItemRepositoryInterface {
  // Future<Either<Failure, int>> createFullItem(final String name,
  //     String? description, List<int>? categoryIds, List<int>? personIds);
  // Future<Either<Failure, int>> createUnassignedItem(
  //     final String name, String? description, List<int>? categoryIds);
  // Future<Either<Failure, int>> createUncategorizedItem(
  //     final String name, String? description, List<int>? personIds);
  Future<Either<Failure, int>> createNamedItem({required final String name});
  Future<Either<Failure, int>> countItems();
  // Future<Either<Failure, ItemEntity>> getItemById({required final int id});
  // Future<Either<Failure, ItemEntityList>> getAllItems();
  // Future<Either<Failure, int>> updateItem({required ItemEntity item});
  Future<void> deleteItemById({required final int id});
  Future<void> deleteAllItems();
}
