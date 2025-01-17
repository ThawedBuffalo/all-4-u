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
  Future<CategoryModel> insertCategory(
      final CategoryModel categoryModel) async {
    final db = await database;
    late final CategoryModel categoryModel;
    await db.transaction((txn) async {
      final id = await txn.insert(
        _categoryTableName,
        categoryModel as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final results = await txn.query(_categoryTableName,
          where: '$_categoryIdColumn = ?', whereArgs: [id]);
      categoryModel = results.first as CategoryModel;
    });
    return categoryModel;
  }

  @override
  Future<CategoryModel> getCategoryById(final int id) async {
    final db = await database;
    late final CategoryModel categoryModel;
    await db.transaction((txn) async {
      final results = await txn.query(_categoryTableName,
          where: '$_categoryIdColumn = ?', whereArgs: [id]);
      categoryModel = results.first as CategoryModel;
    });
    return categoryModel;
  }

}
