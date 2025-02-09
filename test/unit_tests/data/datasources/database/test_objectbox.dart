import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:all_4_u/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<CategoryEntity> categoryBox;

  ObjectBox._create(this._store) {
    categoryBox = Box<CategoryEntity>(_store);
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: "all4Udb");
    return ObjectBox._create(store);
  }
}
