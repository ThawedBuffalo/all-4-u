import 'package:all_4_u/data/datasources/database/all4u_database_intf.dart';
import 'package:all_4_u/data/models/category_model.dart';
import 'package:all_4_u/data/models/person_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class All4UDatabase implements All4UDatabaseInterface {
  static const _databaseName = 'all4u_database';
  static const _databaseVersion = 1;
  static Database? _database;

  static const _categoryTableName = 'categories_table';
  static const _categoryIdColumn = 'id';
  static const _categoryNameColumn = 'name';

  static const _personTableName = 'categories_table';
  static const _personIdColumn = 'id';
  static const _personFirstNameColumn = 'firstName';
  static const _personLastNameColumn = 'lastName';

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
          )
        ''');
        db.execute('''
          CREATE TABLE $_personTableName(
            $_personIdColumn INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            $_personFirstNameColumn TEXT NOT NULL,
            $_personLastNameColumn TEXT NOT NULL,
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

  @override
  Future<CategoryModelList> getAllCategories() async {
    final db = await database;
    return db.query(_categoryTableName);
  }

  @override
  Future<void> deleteCategoryById(int id) async {
    final db = await database;
    await db.delete(
      _categoryTableName,
      where: '$_categoryIdColumn = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> deleteAllCategories() async {
    final db = await database;
    await db.rawDelete(_categoryTableName);
  }

  @override
  Future<CategoryModel> updateCategory(
      CategoryModel updatedCategoryModel) async {
    final db = await database;
    late final CategoryModel categoryModel;
    await db.transaction((txn) async {
      await txn.insert(
        _categoryTableName,
        updatedCategoryModel as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final results = await txn.query(_categoryTableName,
          where: '$_categoryIdColumn = ?',
          whereArgs: [updatedCategoryModel['id']]);
      categoryModel = results.first as CategoryModel;
    });
    return categoryModel;
  }

  // @override
  // Future<void> deleteAllPeople() async {
  //   final db = await database;
  //   await db.rawDelete(_personTableName);
  // }

  // @override
  // Future<void> deletePersonById(int id) async {
  //   final db = await database;
  //   await db.delete(
  //     _personTableName,
  //     where: '$_personIdColumn = ?',
  //     whereArgs: [id],
  //   );
  // }

  // @override
  // Future<PersonModelList> getAllPeople() async {
  //   final db = await database;
  //   return db.query(_personTableName);
  // }

  @override
  Future<PersonModel> getPersonById(int id) async {
    final db = await database;
    late final PersonModel personModel;
    await db.transaction((txn) async {
      final results = await txn.query(_personTableName,
          where: '$_personIdColumn = ?', whereArgs: [id]);
      personModel = results.first as PersonModel;
    });
    return personModel;
  }

  @override
  Future<PersonModel> insertPerson(final PersonModel personModel) async {
    final db = await database;
    late final PersonModel personModel;
    await db.transaction((txn) async {
      final id = await txn.insert(
        _personTableName,
        personModel as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      final results = await txn.query(_personTableName,
          where: '$_personIdColumn = ?', whereArgs: [id]);
      personModel = results.first as PersonModel;
    });
    return personModel;
  }

  // @override
  // Future<PersonModel> updatePerson(PersonModel personModel) async {
  //   final db = await database;
  //   late final PersonModel updatedersonModel;
  //   await db.transaction((txn) async {
  //     await txn.insert(
  //       _personTableName,
  //       personModel as Map<String, Object?>,
  //       conflictAlgorithm: ConflictAlgorithm.replace,
  //     );
  //     final results = await txn.query(_personTableName,
  //         where: '$_personIdColumn = ?', whereArgs: [personModel['id']]);
  //     updatedersonModel = results.first as PersonModel;
  //   });
  //   return updatedersonModel;
  // }
}
