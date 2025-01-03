import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/pages/home/home_page.dart';
import 'package:flutter_template/presentation/pages/home_old/home_page_old.dart';
import 'package:flutter_template/themes/buffalo-sabres-light-theme.dart';

void main() {
  runApp(App());
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
