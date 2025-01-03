import 'package:flutter/cupertino.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';

import 'clear-focus.dart';

class FlashHomePage extends StatefulWidget {
  const FlashHomePage({super.key});

  @override
  State<FlashHomePage> createState() => _FlashHomePageState();
}

class _FlashHomePageState extends State<FlashHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.blue),
            title: const Text('Flash Demo Page',
                style: TextStyle(color: Colors.blue)),
            backgroundColor: Colors.white,
            key: const Key('sign-in-title'),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text('Alert Dialog'),
                            content: const Text(
                                '⚡️A highly customizable, powerful and easy-to-use alerting library for Flutter.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('YES'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('NO'),
                              ),
                            ],
                          );
                        });
                  })
            ]),
        body: ClearFocus(
          child: Column(
            children: <Widget>[
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Test FocusScopeNode',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
              Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const Row(children: <Widget>[Text('Flash Toast')]),
                      ElevatedButton(
                        onPressed: () =>
                            context.showToast(const Text('message (Queue)')),
                        child: const Text('Toast (Queue)'),
                      ),
                      ElevatedButton(
                        onPressed: () => context.showToast(
                          Text('message'),
                          shape: StadiumBorder(),
                          queue: false,
                          alignment: Alignment(0.0, -0.3),
                        ),
                        child: Text('Toast'),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}
