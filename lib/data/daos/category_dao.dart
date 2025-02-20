import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:injectable/injectable.dart';

import '../../core/logging/custom_logger.dart';
import '../database/objectbox.g.dart';
import '../datasources/local_objectbox_datasource.dart';
import 'package:objectbox/objectbox.dart' as objectbox;

@injectable
class CategoryDAO implements CategoryDAOInterface {
  late final objectbox.Store _store;
  final LocalObjectBoxDataSource dataSource;
  late final Box<CategoryDTO> _categoryBox;

  CategoryDAO({required this.dataSource}) {
    _store = dataSource.store;

    // open box
    _categoryBox = objectbox.Box<CategoryDTO>(_store);
  }

  @override
  Future<int> countAll() async {
    return _categoryBox.count();
  }
}
