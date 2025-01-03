import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  TextEditingController widgetController;
  String? title;
  IconData? leadingIcon, trailingIcon;
  Color? inputColor, iconColor;

  TextFormWidget(
      {super.key,
      required this.widgetController,
      required this.title,
      this.leadingIcon = Icons.label,
      this.trailingIcon = Icons.info,
      this.inputColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter some text';
          } else {
            null;
          }
        },
        controller: widgetController,
        decoration: InputDecoration(
          labelText: title,
          icon: Icon(leadingIcon),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
