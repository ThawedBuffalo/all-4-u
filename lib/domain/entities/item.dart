import 'dart:io';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:all_4_u/domain/entities/person.dart';
import 'package:hive/hive.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
@HiveType(typeId: 2)
sealed class Item with _$Item {
  Item._();

  factory Item(
      {@HiveField(0) required String name,
      @HiveField(1) @Default('empty') String description,
      @HiveField(2) required DateTime lastEditDate,
      @HiveField(3) List<Category>? categoryList,
      @HiveField(4) List<Person>? personList,
      @HiveField(5) String? notes,
      @HiveField(6) String? imageFilenameWPath,
      @HiveField(7) String? audioFilenameWPath}) = _Item;

  static Item temp = Item(name: 'tbd', lastEditDate: DateTime.now());

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
