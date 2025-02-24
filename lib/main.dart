import 'package:all_4_u/data/daos/category_dao_intf.dart';
import 'package:all_4_u/data/daos/person_dao_intf.dart';
import 'package:all_4_u/data/datasources/local_objectbox_datasource.dart';
import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/repositories/person_repository_intf.dart';
import 'package:all_4_u/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/core/di/injectable.dart';
import 'package:all_4_u/core/helpers/EitherX.dart';

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

  // category test
  CategoryDAOInterface cdao = getIt<CategoryDAOInterface>();
  CategoryRepositoryInterface crepo = getIt<CategoryRepositoryInterface>();
  var ccount = await crepo.countCategories();

  final response = await crepo.createCategory(name: 'date');
  final response2 = await crepo.createCategory(name: 'gift');
  final response3 = await crepo.createCategory(name: 'favorites');
  ccount = await crepo.countCategories();

  final categoryEntity = await crepo.getCategoryById(id: 1);
  List<CategoryDTO> categories = await cdao.findOne(1);
  final results = await crepo.getAllCategories();
  late CategoryEntity categoryEntityMod;
  if (results.isRight()) {
    CategoryEntityList list = results.asRight();
    CategoryEntity entity = list[0];
    categoryEntityMod = entity.copyWith(name: 'bozo');
  }
  await crepo.updateCategory(category: categoryEntityMod);

  crepo.deleteCategory(categoryId: 1);
  crepo.deleteCategory(categoryId: 2);
  crepo.deleteCategory(categoryId: 3);

  PersonDAOInterface pdao = getIt<PersonDAOInterface>();
  PersonRepositoryInterface prepo = getIt<PersonRepositoryInterface>();
  final pcount = await prepo.countPeople();

  // final presponse = await prepo.createPerson();
  // final categoryEntity = await repo.getCategoryById(1);
  // List<CategoryDTO> categories = dao.findOne(1);
  // final results = await repo.getAllCategories();
  // late CategoryEntity entity2;
  // if (results.isRight()) {
  //   CategoryEntityList list = results.asRight();
  //   CategoryEntity entity = list[0];
  //   entity2 = entity.copyWith(name: 'bozo');
  // }
  //
  // await repo.updateCategory(entity2);

  // repo.deleteCategory(1);
  // repo.deleteCategory(2);
  // repo.deleteCategory(3);
  // repo.deleteAllCategories();

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
