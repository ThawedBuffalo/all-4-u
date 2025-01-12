import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/item.dart';
import 'package:all_4_u/domain/entities/person.dart';
import 'package:all_4_u/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  init();
}

init() async {
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
  await di.init();

  final dir = await getApplicationDocumentsDirectory();

  CustomLogger.loggerNoStack.i('application starting...');
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
