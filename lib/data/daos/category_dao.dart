import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:injectable/injectable.dart';

import '../../core/logging/custom_logger.dart';
import '../database/objectbox.g.dart';
import '../datasources/local_objectbox_datasource.dart';

@Injectable(as: CategoryDAO)
class CategoryDAO implements CategoryDAOInterface {
  final LocalObjectBoxDataSource _dataSource;
  CategoryDAO(this._dataSource);

  @override
  Future<int> delete(int categoryId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<int> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<List<Category>> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<Category?> findOne(int categoryId) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

  @override
  Future<void> insert(Category category) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(Category category) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<int> count() async {
    final store = _dataSource.openStore();

    // open Transaction
    final result = await store.runInTransactionAsync<int, dynamic>(
      TxMode.read,
      (Store store, _) {
        try {
          final box = store.box<Category>();
          final query = box.query().build();

          // count items
          final count = query.count();

          // clean up resources
          query.close();

          return count;
        } catch (error) {
          CustomLogger.loggerNoStack.i("INFO: no data found...");
          return 0;
        }
      },
      null,
    );

    // clean up resources
    store.close();

    return result;
  }
}
