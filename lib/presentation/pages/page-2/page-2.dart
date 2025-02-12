import 'package:all_4_u/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:all_4_u/presentation/pages/page-1/product-model.dart.dart';

class Page2 extends StatelessWidget {
  Page2({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title: const Text('Page 2- Details',
              style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_balance_outlined),
                  title: Text(name),
                )
              ],
            )));
  }
}
