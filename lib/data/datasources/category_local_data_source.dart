import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/exceptions.dart';
import 'category_local_data_source_intf.dart';

const String CATEGORY_DB_NAME = 'CategoryBox';
const String CATEGORY_STORAGE_KEY = 'CategoryKey';

class CategoryLocalDataSource implements CategoryLocalDataSourceInterface {
  CategoryLocalDataSource() {
    init();
  }

  void init() async {}

  @override
  Category getCategory(String categoryName) {
    //TODO: search for category name
    final category = 'test';
    if (category == null) {
      throw LocalStoreException();
    } else {
      return category;
    }
  }

  @override
  Future<void> saveCategory(Category userCategory) async {}
}
