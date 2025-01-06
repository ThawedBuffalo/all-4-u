import 'package:flutter/material.dart';
import 'package:all_4_u/presentation/pages/flash-demo/flash-home-page.dart';
import 'package:all_4_u/presentation/pages/page-1/page-1.dart';
import 'package:all_4_u/presentation/pages/widgets/expandable-fab/action-button.dart';
import 'package:all_4_u/presentation/pages/widgets/expandable-fab/expandable-fab.dart';
import '../../../core/logging/custom_logger.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _actionTitles = ['Create Audio', 'Create Image', 'Create Note'];

  @override
  Widget build(BuildContext context) {
    // demo ways to use logger
    CustomLogger.loggerNoStack.e("ERROR: just showing error...");
    CustomLogger.loggerNoStack.i("INFO: just showing info...");
    CustomLogger.loggerNoStack.d("DEBUG: just showing debug...");

    void _showAction(BuildContext context, int index) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(_actionTitles[index]),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('CLOSE'),
              ),
            ],
          );
        },
      );
    }

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
              style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
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
              style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
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
      ),
      floatingActionButton: ExpandableFab(
        distance: 112,
        children: [
          ActionButton(
            onPressed: () => _showAction(context, 0),
            icon: const Icon(Icons.format_size),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 1),
            icon: const Icon(Icons.insert_photo),
          ),
          ActionButton(
            onPressed: () => _showAction(context, 2),
            icon: const Icon(Icons.videocam),
          )
        ],
      ),
    );
  }
}
