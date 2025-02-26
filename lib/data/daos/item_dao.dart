import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
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
  Future<int> countAll() {
    // TODO: implement countAll
    throw UnimplementedError();
  }

  @override
  Future<void> delete({required int personId}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  void deleteAll() {
    // TODO: implement deleteAll
  }

  @override
  Future<List<ItemDTO>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<List<ItemDTO>> findOne({required int personId}) {
    // TODO: implement findOne
    throw UnimplementedError();
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
