import 'package:flutter/material.dart';
import 'package:flutter_template/core/logging/custom_logger.dart';
import 'package:flutter_template/presentation/pages/page-1/product-model.dart.dart';
import 'package:flutter_template/presentation/pages/widgets/radio-button-widget.dart';
import 'package:flutter_template/presentation/pages/widgets/text-form-widget.dart';

import '../page-2/page-2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  _Page1State() {
    _sizeSelected = _sizeOptions[0];
  }

  final String _productName = 'Product Name';
  final String _productDescription = 'Description';
  final _productController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _topSeller = false;
  bool _topRated = false;
  var selectedColor;

  // define variables for radio button section
  List<String> colorOptions = ['blue', 'gold'];
  int colorOptionsGroup = 1;

  // define values for dropdown fields
  final _sizeOptions = ["Small", "Medium", "Large", "Xlarge"];
  String _sizeSelected = 'Small';

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
                  widgetController: _productController,
                  title: _productName,
                  leadingIcon: Icons.ac_unit_outlined, //dynamic icon
                ),
                const SizedBox(height: 20.0),
                TextFormWidget(
                  widgetController: _descriptionController,
                  title: _productDescription,
                  leadingIcon: Icons.shopping_bag_outlined, //dynamic icon
                ),
                const SizedBox(height: 20.0),
                // TODO- create generic external widget
                CheckboxListTile(
                  value: _topSeller,
                  title: const Text("Top Seller"),
                  onChanged: (value) {
                    setState(() {
                      _topSeller = value!;
                      CustomLogger.loggerNoStack.i('top seller: $_topSeller');
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                //const SizedBox(height: 10.0),
                CheckboxListTile(
                  value: _topRated,
                  title: const Text("Top Rated"),
                  onChanged: (value) {
                    setState(() {
                      _topRated = value!;
                      CustomLogger.loggerNoStack.i('top rated: $_topRated');
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                const SizedBox(height: 20.0),
                Text('Select color:'),
                Row(
                  children: [
                    RadioButtonWidget(
                        title: Text(colorOptions[0]),
                        value: 0,
                        groupValue: colorOptionsGroup,
                        onChanged: (value) {
                          setState(() {
                            selectedColor = colorOptions[value];
                            CustomLogger.loggerNoStack.i(
                                'user selected value- ->$value<-, item ->$selectedColor<-');
                            colorOptionsGroup = value;
                          });
                        }),
                    const SizedBox(
                      width: 5.0,
                    ),
                    RadioButtonWidget(
                        title: Text(colorOptions[1]),
                        value: 1,
                        groupValue: colorOptionsGroup,
                        onChanged: (value) {
                          setState(() {
                            selectedColor = colorOptions[value];
                            CustomLogger.loggerNoStack.i(
                                'user selected value- ->$value<-, item ->$selectedColor<-');
                            colorOptionsGroup = value;
                          });
                        }),
                  ],
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField(
                  value: _sizeSelected,
                  items: _sizeOptions
                      .map((e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _sizeSelected = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: Colors.deepPurple,
                  ),
                  dropdownColor: Colors.deepPurple.shade50,
                  decoration: const InputDecoration(
                      labelText: "Select size:",
                      prefixIcon: Icon(Icons.account_balance),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(200, 50)),
                  onPressed: () {
                    CustomLogger.loggerNoStack
                        .i("INFO: mapping user values to model, submitting...");

                    if (_formKey.currentState!.validate()) {
                      ProductModel product = ProductModel(
                          name: _productController.text,
                          description: _descriptionController.text,
                          topSeller: _topSeller,
                          topRated: _topRated,
                          color: selectedColor,
                          size: _sizeSelected);

                      var result = product.toJson();
                      CustomLogger.loggerNoStack.i("INFO: $result");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Page2(
                            product: product,
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
