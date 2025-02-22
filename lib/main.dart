import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/datasources/local_objectbox_datasource.dart';
import 'package:all_4_u/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/core/di/injectable.dart';

import 'core/configs/local_directory_intf.dart';

import 'domain/repositories/category_repository_intf.dart';

// ref: https://github.com/devmuaz/flutter-clean-architecture
// https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47

void main() async {
  init();
}

Future<void> init() async {
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   FlutterError.dumpErrorToConsole(details);
  //   runApp(ErrorWidgetClass(details));
  // };

  // implement logging framework
  // CustomLogger logger =
  // CustomLogger(callingClass: 'main', defLogLevel: MessageTypes.info);
  //
  // logger.logIt(
  //     methodName: 'init()',
  //     type: MessageTypes.info,
  //     message: 'application initializing...');
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  CustomLogger.loggerNoStack.i('application starting...');
  LocalDirectoryInterface intf = getIt<LocalDirectoryInterface>();
  LocalObjectBoxDataSource dataSource = getIt<LocalObjectBoxDataSource>();
  await dataSource.initStore();
  // begin testing di
  CategoryDAOInterface dao = getIt<CategoryDAOInterface>();
  CategoryRepositoryInterface repo = getIt<CategoryRepositoryInterface>();
  final count = await repo.countCategories();
  //final int count = 1;
  //CustomLogger.loggerNoStack.i('count is-> $count <-');
  // end testing di
  runApp(App());
}

class App extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Placeholder Page',
      //theme: buffaloSabresLightTheme,
      home: const HomePage(),
    );
  }
}
