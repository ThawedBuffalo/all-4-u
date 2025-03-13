import 'dart:io';

/// created from issue of not all files are being read to test for coverage
/// https://github.com/flutter/flutter/issues/27997

const packageName = 'all_4_u';

void main() async {
  final cwd = Directory.current.uri;
  final libDir = Directory.fromUri(cwd.resolve('lib'));
  final buffer = StringBuffer();

  var files = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) =>
          file.path.endsWith('.dart') &&
          !file.path.contains('.freezed.') &&
          !file.path.contains('.g.') &&
          !file.readAsLinesSync().any((line) => line.startsWith('part of')))
      .toList();

  buffer.writeln('// ignore_for_file: unused_import');
  buffer.writeln();

  for (var file in files) {
    final fileLibPath =
        file.uri.toFilePath().substring(libDir.uri.toFilePath().length);
    buffer.writeln('import \'package:$packageName/$fileLibPath\';');
  }

  buffer.writeln();
  buffer.writeln('void main() {}');
  buffer.writeln();

  final output =
      File(cwd.resolve('test/coverage_helper_test.dart').toFilePath());
  await output.writeAsString(buffer.toString());
}
