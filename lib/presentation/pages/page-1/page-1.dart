import 'package:flutter/material.dart';
import 'package:all_4_u/core/logging/custom_logger.dart';
import 'package:all_4_u/presentation/pages/widgets/text-form-widget.dart';

import '../../../data/repositories/category_repository.dart';
import '../../../data/repositories/store_repository.dart';
import '../page-2/page-2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final String _categoryName = 'Product Name';
  final _categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.blue),
          title:
              const Text('Page 1- Form', style: TextStyle(color: Colors.blue)),
          backgroundColor: Colors.white,
          key: const Key('sign-in-title'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormWidget(
                  widgetController: _categoryController,
                  title: _categoryName,
                  leadingIcon: Icons.ac_unit_outlined, //dynamic icon
                ),
                const SizedBox(height: 20.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(200, 50)),
                  onPressed: () async {
                    CustomLogger.loggerNoStack
                        .i("INFO: mapping user values to model, submitting...");

                    if (_formKey.currentState!.validate()) {
                      String categoryName = _categoryController.text;
                      CustomLogger.loggerNoStack.i("INFO: ->$categoryName<-");

                      // CategoryRepository repo =
                      //     CategoryRepository(store: storeRepo.store);
                      // repo.createCategory(categoryName);

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Page2(
                            name: categoryName,
                          );
                        },
                      ));
                    }
                  }, // onPressed
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
        ));
  }
}
