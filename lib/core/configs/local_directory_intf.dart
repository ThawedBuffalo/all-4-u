import 'dart:io';

import 'package:injectable/injectable.dart';

abstract class LocalDirectoryInterface {
  Future<String> getDirectory();
}
