import 'package:all_4_u/core/helpers/EitherX.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/item_entity_list.dart';
import '../../domain/repositories/item_repository_intf.dart';
import '../daos/item_dao_intf.dart';
import '../dtos/item_dto.dart';
import '../mapper/item_entity_list_mapper.dart';

@Injectable(as: ItemRepositoryInterface)
class ItemRepository implements ItemRepositoryInterface {
  final ItemDAOInterface itemDAO;

  const ItemRepository({required this.itemDAO});

  @override
  Future<Either<Failure, int>> countItems() async {
    final numberOfItems = await itemDAO.countAll();
    if (numberOfItems == 0) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return Right(numberOfItems);
    }
  }

  // @override
  // Future<Either<Failure, int>> createFullItem({required String name, String? description,
  //     List<int>? categoryIds, List<int>? personIds) {
  //   // TODO: implement createFullItem
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, int>> createNamedItem({required String name}) async {
    // must set ID to 0 for DB to autoincrement
    ItemDTO itemDTO = ItemDTO(id: 0, name: name);
    final result = await itemDAO.insert(item: itemDTO);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }

  // @override
  // Future<Either<Failure, int>> createUnassignedItem(
  //     String name, String? description, List<int>? categoryIds) {
  //   // TODO: implement createUnassignedItem
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<Either<Failure, int>> createUncategorizedItem(
  //     String name, String? description, List<int>? personIds) {
  //   // TODO: implement createUncategorizedItem
  //   throw UnimplementedError();
  // }
  //
  @override
  Future<void> deleteAllItems() async {
    itemDAO.deleteAll();
  }

  @override
  Future<void> deleteItemById({required int id}) async {
    itemDAO.delete(itemId: id);
  }

  @override
  Future<Either<Failure, ItemEntityList>> getAllItems() async {
    itemDAO.findAll();

    final List<ItemDTO> personDTOList = await itemDAO.findAll();

    if (personDTOList.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      return Right(
          ItemEntityListMapper.transformDTOListToEntityList(personDTOList));
    }
  }

  // @override
  // Future<Either<Failure, ItemEntity>> getItemById({required int id}) {
  //   // TODO: implement getItemById
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<Either<Failure, int>> updateItem({required ItemEntity item}) {
  //   // TODO: implement updateItem
  //   throw UnimplementedError();
  // }
}
