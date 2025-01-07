import 'dart:io';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:all_4_u/domain/entities/person.dart';
import 'package:hive/hive.dart';

part 'item.freezed.dart';
part 'item.g.dart';


@freezed
class Item with _$Item {
  Item._();

  @HiveType(typeId: 2)
  factory Item({
    required int id,
    required String name,
    required String description,
    required DateTime lastEditDate,
    required List<Category> categoryList,
    required List<Person> personList,
    required File audioFile,
    //required Image imageFile
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
