import 'package:all_4_u/data/dtos/item_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../database/objectbox.g.dart';
import '../datasources/local_objectbox_datasource.dart';
import 'package:objectbox/objectbox.dart' as objectbox;

import 'item_dao_intf.dart';

@Injectable(as: ItemDAOInterface)
class ItemDAO implements ItemDAOInterface {
  late final objectbox.Store _store;
  final LocalObjectBoxDataSource dataSource;
  late final Box<ItemDTO> _itemBox;

  ItemDAO({required this.dataSource}) {
    _store = dataSource.store;

    // open box
    _itemBox = objectbox.Box<ItemDTO>(_store);
  }

  @override
  Future<int> countAll() async {
    final int itemCount = _itemBox.count();
    return itemCount;
  }

  @override
  Future<void> delete({required int itemId}) async {
    Query<ItemDTO> query =
        _store.box<ItemDTO>().query(ItemDTO_.id.equals(itemId)).build();
    await query.removeAsync();
    query.close();
  }

  @override
  Future<void> deleteAll() async {
    await _store.box<ItemDTO>().removeAllAsync();
  }

  @override
  Future<List<ItemDTO>> findAll() async {
    Query<ItemDTO> query =
        _store.box<ItemDTO>().query().order(ItemDTO_.id).build();
    List<ItemDTO> items = await query.findAsync();
    query.close();
    return items;
  }

  @override
  Future<List<ItemDTO>> findOne({required int itemId}) async {
    Query<ItemDTO> query =
        _store.box<ItemDTO>().query(ItemDTO_.id.equals(itemId)).build();
    List<ItemDTO> items = await query.findAsync();
    query.close();
    return items;
  }

  @override
  Future<Either<String, int>> insert({required ItemDTO item}) async {
    late int result;
    try {
      result = await _itemBox.putAsync(item);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
