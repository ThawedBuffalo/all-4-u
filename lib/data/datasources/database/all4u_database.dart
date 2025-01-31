import 'package:all_4_u/data/datasources/database/all4u_database_intf.dart';
import 'package:all_4_u/data/models/category_model.dart';
import 'package:all_4_u/data/models/item_model.dart';
import 'package:all_4_u/data/models/person_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class All4UDatabase implements All4UDatabaseInterface {
  static const _databaseName = 'all4u_database';
  static const _databaseVersion = 1;
  static Database? _database;

  // Category section
  static const _categoryTableName = 'categories_table';
  static const _categoryIdColumn = 'id';
  static const _categoryNameColumn = 'name';

  // Person section
  static const _personTableName = 'person_table';
  static const _personIdColumn = 'id';
  static const _personFirstNameColumn = 'firstName';
  static const _personLastNameColumn = 'lastName';

  // Item section
  static const _itemTableName = 'item_table';
  static const _itemIdColumn = 'id';
  static const _itemNameColumn = 'name';
  static const _itemDescription = 'description';
  // TODO- add the category/person columns
  // static const _itemCategoryList = 'lastName';

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    var docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, 'app.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $_categoryTableName '
        '($_categoryIdColumn INTEGER PRIMARY KEY '
        'AUTOINCREMENT,'
        ' $_categoryNameColumn TEXT NOT NULL'
        ')');

    await db.execute('CREATE TABLE $_personTableName '
        '($_personIdColumn INTEGER PRIMARY KEY,'
        ' $_personFirstNameColumn TEXT NOT NULL,'
        ' $_personLastNameColumn TEXT NOT NULL,'
        ')');

    await db.execute('CREATE TABLE $_itemTableName '
        '($_itemIdColumn INTEGER PRIMARY KEY,'
        '($_itemNameColumn TEXT NOT NULL,'
        ' $_itemDescription TEXT NOT NULL,'
        ')');
  }

  //
  // Category CRUD section
  //
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
  Future<int> getCategoryCount() async {
    final db = await database;
    return Sqflite.firstIntValue(db.rawQuery('SELECT COUNT(*) FROM $_categoryTableName'));

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

  //
  // People CRUD section
  //
  @override
  Future<void> deleteAllPeople() async {
    final db = await database;
    await db.rawDelete(_personTableName);
  }

  @override
  Future<void> deletePersonById(int id) async {
    final db = await database;
    await db.delete(
      _personTableName,
      where: '$_personIdColumn = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<PersonModelList> getAllPeople() async {
    final db = await database;
    return db.query(_personTableName);
  }

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

  @override
  Future<PersonModel> updatePerson(PersonModel personModel) async {
    final db = await database;
    late final PersonModel updatedPersonModel;
    await db.transaction((txn) async {
      await txn.insert(
        _personTableName,
        personModel as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final results = await txn.query(_personTableName,
          where: '$_personIdColumn = ?', whereArgs: [personModel['id']]);
      updatedPersonModel = results.first as PersonModel;
    });
    return updatedPersonModel;
  }

  //
  // Item CRUD section
  //
  @override
  Future<ItemModel> insertItem(ItemModel itemModel) async {
    final db = await database;
    late final ItemModel itemModel;
    await db.transaction((txn) async {
      final id = await txn.insert(
        _itemTableName,
        itemModel as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      final results = await txn
          .query(_itemTableName, where: '$_itemIdColumn = ?', whereArgs: [id]);
      itemModel = results.first as ItemModel;
    });
    return itemModel;
  }

  @override
  Future<ItemModel> getItemById(int id) async {
    final db = await database;
    late final ItemModel itemModel;
    await db.transaction((txn) async {
      final results = await txn
          .query(_itemTableName, where: '$_itemIdColumn = ?', whereArgs: [id]);
      itemModel = results.first as ItemModel;
    });
    return itemModel;
  }
}
