import 'dart:io';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:all_4_u/domain/entities/person.dart';
import 'package:hive/hive.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
sealed class Item with _$Item {
  Item._();

  @HiveType(typeId: 2)
  factory Item(
      { //required int id,
      required String name,
      @Default('empty') String description,
      required DateTime lastEditDate,
      List<Category>? categoryList,
      List<Person>? personList,
      String? notes,
      String? imageFilenameWPath,
      String? audioFilenameWPath}) = _Item;

  static Item temp = Item(name: 'tbd', lastEditDate: DateTime.now());

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
