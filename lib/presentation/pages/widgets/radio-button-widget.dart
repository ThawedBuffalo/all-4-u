import 'package:flutter/material.dart';

class RadioButtonWidget extends StatelessWidget {
  final int value;
  final int groupValue;
  final String? leading;
  final Widget? title;
  final ValueChanged? onChanged;

  const RadioButtonWidget(
      {required this.value,
      required this.groupValue,
      required this.onChanged,
      this.leading,
      this.title});

  //final List<String> optionsList = ['one', 'two','three'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: RadioListTile(
            title: title,
            contentPadding: const EdgeInsets.all(0.0),
            value: value,
            groupValue: groupValue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            dense: true,
            tileColor: Colors.deepPurple.shade50,
            onChanged: onChanged));
  }
}
