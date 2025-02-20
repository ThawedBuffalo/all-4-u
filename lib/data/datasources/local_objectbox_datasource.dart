import 'dart:io';
import 'package:all_4_u/core/configs/local_directory_intf.dart';
import 'package:all_4_u/data/database/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart' as objectbox;
import 'package:path/path.dart' show join;

import '../database/objectbox.g.dart';

@lazySingleton
class LocalObjectBoxDataSource {
  late final objectbox.Store _store;
  final LocalDirectoryInterface directory;
  String get _version => 'v1';

  LocalObjectBoxDataSource({required this.directory});
  Future<void> initStore() async {
    var dir = await directory.getDirectory();

    _store =
        Store(getObjectBoxModel(), directory: join(dir, 'all4u_db_$_version'));
    return;
  }

  // Getter for store
  objectbox.Store get store => _store;
}
