// import 'dart:io';
// import 'package:objectbox/objectbox.dart' as objectbox;
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
// import 'package:all_4_u/objectbox.g.dart';
//
// class StoreRepository {
//   late final Store _store;
//
//   Future<void> initStore() async {
//     late final docsDir;
//     late final objectbox.Store _store;
//     final String dbName = 'all4Udb';
//
//     if (Platform.isAndroid) {
//       //
//       print('OS is Android');
//       //
//       docsDir = await getApplicationSupportDirectory();
//       print('database dir:-> $docsDir <-');
//       //store = await openStore(directory: p.join(docsDir.path, dbName));
//     } else if (Platform.isIOS) {
//       print('OS is iOS');
//       docsDir = await getApplicationSupportDirectory();
//       print('database dir:-> $docsDir <-');
//       //store = await openStore(directory: p.join(docsDir.path, 'all4Udb'));
//     } else if (Platform.isMacOS) {
//       //docsDir = await getApplicationDocumentsDirectory();
//       docsDir = await getApplicationSupportDirectory();
//       //store = await openStore(directory: dbName);
//       //store = await openStore(directory: p.join(docsDir.path, 'all4Udb'));
//       print('OS is macOS');
//       print('database dir:-> $docsDir <-');
//     } else if (Platform.isWindows) {
//       print('OS is Windows');
//     }
//
//     _store =
//         Store(getObjectBoxModel(), directory: p.join(docsDir.path, 'all4Udb'));
//
//     return;
//   }
//
//   objectbox.Store get store => _store;
// }
