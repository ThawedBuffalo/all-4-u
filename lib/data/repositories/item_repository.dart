import 'package:all_4_u/domain/entities/item_entity_list.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_repository_intf.dart';
import '../daos/item_dao_intf.dart';

@Injectable(as: ItemRepositoryInterface)
class ItemRepository implements ItemRepositoryInterface {
  final ItemDAOInterface itemDAO;

  const ItemRepository({required this.itemDAO});

  @override
  Future<Either<Failure, int>> countItems() {
    // TODO: implement countItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> createFullItem(String name, String? description,
      List<int>? categoryIds, List<int>? personIds) {
    // TODO: implement createFullItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> createNamedItem(String name) {
    // TODO: implement createNamedItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> createUnassignedItem(
      String name, String? description, List<int>? categoryIds) {
    // TODO: implement createUnassignedItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> createUncategorizedItem(
      String name, String? description, List<int>? personIds) {
    // TODO: implement createUncategorizedItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllItems() {
    // TODO: implement deleteAllItems
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItemById(int id) {
    // TODO: implement deleteItemById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ItemEntityList>> getAllItems() {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ItemEntity>> getItemById({required int id}) {
    // TODO: implement getItemById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> updateItem({required ItemEntity item}) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
