import 'package:all_4_u/data/datasources/database/all4u_database_intf.dart';
import 'package:all_4_u/data/models/category_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class All4UDatabase implements All4UDatabaseInterface {
  static const _databaseName = 'all4u_database';
  static const _databaseVersion = 1;
  static Database? _database;

  static const _categoryTableName = 'categories_table';
  static const _categoryIdColumn = 'id';
  static const _categoryNameColumn = 'name';
  static const _categoryLastEditDateColumn = 'lastEditDate';

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, _) {
        db.execute('''
          CREATE TABLE $_categoryTableName(
            $_categoryIdColumn INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_categoryNameColumn TEXT NOT NULL,
            $_categoryLastEditDateColumn TEXT NOT NULL
          )
        ''');
      },
      version: _databaseVersion,
    );
  }

  @override
  Future<CategoryModel> allCategories() {
    // TODO: implement allCategories
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(int id) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<CategoryModel> insertCategory(CategoryModel categoryModel) {
    // TODO: implement insertCategory
    throw UnimplementedError();
  }

  @override
  Future<void> updateCategory(CategoryModel categoryModel) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
