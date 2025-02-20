import 'dart:io';

import 'package:all_4_u/core/configs/local_directory_intf.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@Injectable(as: LocalDirectoryInterface)
class LocalDirectory implements LocalDirectoryInterface {
  @override
  Future<String> getDirectory() async {
    final Directory appSupDir = await getApplicationSupportDirectory();
    var storeLocation = appSupDir.path;
    return storeLocation;
  }
}
