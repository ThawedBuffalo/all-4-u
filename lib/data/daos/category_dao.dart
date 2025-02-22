import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:injectable/injectable.dart';

import '../../core/logging/custom_logger.dart';
import '../database/objectbox.g.dart';
import '../datasources/local_objectbox_datasource.dart';
import 'package:objectbox/objectbox.dart' as objectbox;

@Injectable(as: CategoryDAOInterface)
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
  int countAll() {
    int catCount = _categoryBox.count();
    //return _categoryBox.count();
    return catCount;
  }

  @override
  void insert(CategoryDTO category) {
    _categoryBox.put(category);
  }
}
