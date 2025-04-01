import 'package:all_4_u/core/helpers/EitherX.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/error_messages.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/category_entity_list.dart';
import '../../domain/entities/item_entity_list.dart';
import '../../domain/entities/person_entity_list.dart';
import '../../domain/repositories/item_repository_intf.dart';
import '../daos/item_dao_intf.dart';
import '../dtos/item_dto.dart';
import '../mapper/category_entity_mapper.dart';
import '../mapper/item_entity_list_mapper.dart';
import '../mapper/item_entity_mapper.dart';
import '../mapper/person_entity_mapper.dart';

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

  @override
  Future<Either<Failure, ItemEntity>> getItemById({required int id}) async {
    final List<ItemDTO> itemDTOList = await itemDAO.findOne(itemId: id);

    if (itemDTOList.isEmpty) {
      return Left(DBEmptyResult(errorMessage: DB_EMPTY_RESULTS_FAILURE));
    } else {
      if (itemDTOList.length > 1) {
        return Left(DBEmptyResult(errorMessage: DB_RETURNED_MORE));
      } else {
        return Right(ItemEntityMapper.transformDTOToEntity(itemDTOList[0]));
      }
    }
  }

  @override
  Future<Either<Failure, int>> updateItem({required ItemEntity item}) async {
    final result =
        await itemDAO.insert(item: ItemEntityMapper.transformEntityToDTO(item));

    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }

  @override
  Future<Either<Failure, int>> createFullItem(
      {required String name,
      String? description,
      CategoryEntityList? categoryEntityList,
      PersonEntityList? personEntityList}) async {
    // must set ID to 0 for DB to autoincrement
    ItemDTO item = ItemDTO(id: 0, name: name, description: description);

    if (categoryEntityList != null) {
      for (int i = 0; i < categoryEntityList.length; i++) {
        item.categories.add(
            CategoryEntityMapper.transformEntityToDTO(categoryEntityList[i]));
      }
    }

    if (personEntityList != null) {
      for (int i = 0; i < personEntityList.length; i++) {
        item.people
            .add(PersonEntityMapper.transformEntityToDTO(personEntityList[i]));
      }
    }

    final result = await itemDAO.insert(item: item);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }

  @override
  Future<Either<Failure, int>> createUnassignedItem({required String name,
      String? description, CategoryEntityList? categoryEntityList}) async {
    // must set ID to 0 for DB to autoincrement
    ItemDTO item = ItemDTO(id: 0, name: name, description: description);

    if (categoryEntityList != null) {
      for (int i = 0; i < categoryEntityList.length; i++) {
        item.categories.add(
            CategoryEntityMapper.transformEntityToDTO(categoryEntityList[i]));
      }
    }

    final result = await itemDAO.insert(item: item);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }

  @override
  Future<Either<Failure, int>> createUncategorizedItem({
    required String name, String? description, PersonEntityList? personEntityList}) async {
    // must set ID to 0 for DB to autoincrement
    ItemDTO item = ItemDTO(id: 0, name: name, description: description);

    if (personEntityList != null) {
      for (int i = 0; i < personEntityList.length; i++) {
        item.people.add(
            PersonEntityMapper.transformEntityToDTO(personEntityList[i]));
      }
    }

    final result = await itemDAO.insert(item: item);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: result.asLeft()));
    } else {
      return Right(result.asRight());
    }
  }
}
