import 'dart:io';

import 'package:all_4_u/core/configs/local_directory_intf.dart';
import 'package:all_4_u/data/database/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart' as objectbox;
import 'package:path/path.dart' show join;
import 'package:all_4_u/core/logging/custom_logger.dart';
import '../../core/constants/enums.dart';
import '../database/objectbox.g.dart';

@lazySingleton
class LocalObjectBoxDataSource {
  late final objectbox.Store _store;
  final LocalDirectoryInterface directory;
  final String version = 'v1';
  final String dbName = 'all4udb';

  LocalObjectBoxDataSource({required this.directory});

  Future<void> initStore({required Environments environment}) async {
    var dir = await directory.getDirectory();
    var env = environment;
    final String envPrefix = env.name;
    final String dbLocation = dir.toString();
    final String dbFullName = '$envPrefix.$dbName.$version';
    _store = Store(getObjectBoxModel(), directory: join(dir, dbFullName));
    CustomLogger.loggerNoStack
        .i('database initializing ->$dbLocation/$dbFullName<-');
    // _store.close();
    return;
  }

  Future<void> deleteStore({required Environments environment}) async {
    var dir = await directory.getDirectory();
    var env = environment;
    final String envPrefix = env.name;
    final String dbFullName = '$envPrefix.$dbName.$version';
    final dbDirToDelete = join(dir, dbFullName);
    final File targetDir = File('$dir/$dbFullName');
    await targetDir.delete();
    CustomLogger.loggerNoStack.i('database reset ->$dbDirToDelete<-');
    return;
  }

  // Getter for store
  objectbox.Store get store => _store;
}
