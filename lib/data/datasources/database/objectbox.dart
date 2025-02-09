import 'dart:io';

import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:all_4_u/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<CategoryEntity> categoryBox;

  ObjectBox._create(this._store) {
    categoryBox = Box<CategoryEntity>(_store);
  }

  static Future<ObjectBox> create() async {
    late final docsDir;
    late final store;
    final String dbName = 'all4Udb';

    if (Platform.isAndroid) {
      //
      print('OS is Android');
      //
      docsDir = await getApplicationSupportDirectory();
      print('database dir:-> $docsDir <-');
      store = await openStore(directory: p.join(docsDir.path, dbName));
    } else if (Platform.isIOS) {
      print('OS is iOS');
      docsDir = await getApplicationSupportDirectory();
      print('database dir:-> $docsDir <-');
      store = await openStore(directory: p.join(docsDir.path, 'all4Udb'));
    } else if (Platform.isMacOS) {
      //print('database dir:-> $docsDir <-');
      docsDir = await getApplicationSupportDirectory();
      store = await openStore(directory: dbName);
      print('OS is macOS');
    } else if (Platform.isWindows) {
      print('OS is Windows');
    }

    //

    return ObjectBox._create(store);
  }
}
