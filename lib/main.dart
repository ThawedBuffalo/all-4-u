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

import 'core/constants/enums.dart';
import 'data/daos/item_dao_intf.dart';
import 'data/dtos/item_dto.dart';
import 'domain/entities/person_entity.dart';
import 'domain/entities/person_entity_list.dart';
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
  CustomLogger.loggerNoStack.i('CategoryDAO test starting...');
  LocalDirectoryInterface intf = getIt<LocalDirectoryInterface>();
  LocalObjectBoxDataSource dataSource = getIt<LocalObjectBoxDataSource>();
  /**
   * IMPT: TODO- ensure env is set for proper distribution:
   *             dev, test, prod
   */
  await dataSource.initStore(environment: Environments.test);

  // begin testing di

  // category test
  CategoryDAOInterface cdao = getIt<CategoryDAOInterface>();

  // final response = await crepo.createCategory(name: 'date');
  // final response2 = await crepo.createCategory(name: 'gift');
  // final response3 = await crepo.createCategory(name: 'favorites');
  // ccount = await crepo.countCategories();
  // crepo.deleteAllCategories();
  //
  // final categoryEntity = await crepo.getCategoryById(id: 1);
  // //List<CategoryDTO> categories = await cdao.findOne(1);
  // final results = await crepo.getAllCategories();
  // late CategoryEntity categoryEntityMod;
  // if (results.isRight()) {
  //   CategoryEntityList list = results.asRight();
  //   CategoryEntity entity = list[0];
  //   categoryEntityMod = entity.copyWith(name: 'bozo');
  // }
  // await crepo.updateCategory(category: categoryEntityMod);
  // var catResult = await crepo.getAllCategories();
  //
  // crepo.deleteCategory(categoryId: 1);
  // crepo.deleteCategory(categoryId: 2);
  // crepo.deleteCategory(categoryId: 3);
  // ccount = await crepo.countCategories();

  // end category test

  // begin person test
  PersonDAOInterface pdao = getIt<PersonDAOInterface>();
  // PersonRepositoryInterface prepo = getIt<PersonRepositoryInterface>();
  // var pcount = await prepo.countPeople();
  //
  // await prepo.createPerson(firstName: 'Jim', lastName: 'Reid');
  // await prepo.createPerson(firstName: 'Ana', lastName: 'Reid');
  // await prepo.createPerson(firstName: 'Jordan', lastName: 'Reid');
  // pcount = await prepo.countPeople();
  // prepo.deleteAllPeople();
  //
  // final results = await prepo.getPersonById(id: 1);
  // late PersonEntity person2;
  // if (results.isRight()) {
  //   PersonEntity person = results.asRight();
  //   person2 = person.copyWith(firstName: 'Mia');
  // }
  // await prepo.updatePerson(person: person2);
  // final response = await prepo.getAllPeople();
  // prepo.deletePerson(id: 1);
  // pcount = await prepo.countPeople();
  // prepo.deleteAllPeople();
  // pcount = await prepo.countPeople();
  // end person test

  // begin item testing

  ItemDAOInterface idao = getIt<ItemDAOInterface>();
  var icount = await idao.countAll();
  ItemDTO item = ItemDTO(
      id: 0, name: 'hatchet throwing', description: 'something cool to do');
  item.categories.add(CategoryDTO(id: 0, name: 'lunch'));
  item.categories.add(CategoryDTO(id: 0, name: 'dinner'));
  item.people.add(PersonDTO(id: 0, firstName: 'JC', lastName: 'Reid'));
  await idao.insert(item: item);
  icount = await idao.countAll();
  // idao.deleteAll();
  var catCount = await cdao.countAll();
  var peepCount = await pdao.countAll();

  // check to see if category/people are deleted also

  // end item testing

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
