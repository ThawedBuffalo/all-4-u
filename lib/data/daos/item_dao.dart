import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
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
  late final Box<ItemDTO> _categoryBox;

  ItemDAO({required this.dataSource}) {
    _store = dataSource.store;

    // open box
    _categoryBox = objectbox.Box<ItemDTO>(_store);
  }

}
