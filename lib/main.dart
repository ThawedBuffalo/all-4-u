import 'package:all_4_u/presentation/pages/home/home_page.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:all_4_u/themes/buffalo-sabres-light-theme.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';

import 'core/logging/logger_enums.dart';

void main() {
  runApp(App());
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
}

class App extends StatefulWidget {
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
