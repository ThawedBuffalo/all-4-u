import 'dart:io';
import 'package:all_4_u/data/database/objectbox.g.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' show join;

@lazySingleton
class LocalObjectBoxDataSource {
  final Directory directory;
  String get _version => 'v1';

  LocalObjectBoxDataSource(@Named('AppDocumentsDirectory') this.directory);
  Store openStore() => Store(getObjectBoxModel(),
      directory: join(directory.path, 'all4u_db_$_version'));
}
