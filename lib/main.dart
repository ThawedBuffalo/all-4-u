import 'package:all_4_u/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:path_provider/path_provider.dart';
import 'data/repositories/store_repository.dart';
import 'injection_container.dart' as di;

// ref: https://github.com/devmuaz/flutter-clean-architecture
// https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47

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
