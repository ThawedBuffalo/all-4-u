import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/pages/flash-demo/flash-home-page.dart';
import 'package:flutter_template/presentation/pages/page-1/page-1.dart';
import '../../../core/logging/custom_logger.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // demo ways to use logger
    CustomLogger.loggerNoStack.e("ERROR: just showing error...");
    CustomLogger.loggerNoStack.i("INFO: just showing info...");
    CustomLogger.loggerNoStack.d("DEBUG: just showing debug...");

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text('Welcome!', style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Center(
          // child: buildBody(context)));
          child: Column(children: [
            const SizedBox(
              height: 20.0,
            ),
            Image.asset(
              'assets/images/Sabres.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 20.0,
            ),
            OutlinedButton(
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                onPressed: () {
                  CustomLogger.loggerNoStack.i("INFO: navigating to Form...");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Page1();
                    },
                  ));
                },
                child: const Text("Go To Form")),
            const SizedBox(height: 20.0),
            OutlinedButton(
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                onPressed: () {
                  CustomLogger.loggerNoStack
                      .i("INFO: navigating to Notifications...");
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const FlashHomePage();
                    },
                  ));
                },
                child: const Text("Go To Flash Demo"))
          ]),
        ));
  }
}
