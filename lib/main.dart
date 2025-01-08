import 'package:all_4_u/domain/entities/category.dart';
import 'package:all_4_u/domain/entities/item.dart';
import 'package:all_4_u/domain/entities/person.dart';
import 'package:all_4_u/presentation/pages/home/home_page.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:all_4_u/themes/buffalo-sabres-light-theme.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'core/logging/logger_enums.dart';
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
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(ItemAdapter());

  CustomLogger.loggerNoStack.i('application starting...');
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, _) {
        var child = _!;
        child = Toast(
          navigatorKey: navigatorKey,
          child: child,
        );
        return child;
      },
      title: 'Placeholder Page',
      //theme: buffaloSabresLightTheme,
      home: const HomePage(),
    );
  }
}
