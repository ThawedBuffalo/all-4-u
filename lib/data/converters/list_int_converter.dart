import 'dart:convert';

import 'package:floor/floor.dart';

class ListIntConverter extends TypeConverter<List<int>?, String> {
  @override
  List<int>? decode(String databaseValue) {
    final jsonString = json.decode(databaseValue);
    List<int> categoryIdList = jsonString.split(',').map(int.parse).toList();
    return categoryIdList;
  }

  @override
  String encode(List<int>? value) {
    String categoryIds = '';
    for (int i = 0; i < value!.length; i++) {
      if (i != value!.length - 1) {
        categoryIds = '$categoryIds$value[i].toString(),';
      } else {
        categoryIds = '$categoryIds$value[i]'.toString();
      }
    }
    return categoryIds;
  }
}
