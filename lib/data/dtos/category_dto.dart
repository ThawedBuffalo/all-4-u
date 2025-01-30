import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

// ref: https://quashbugs.com/blog/exploring-flutters-floor-library-for-efficient-data-persistence
// https://medium.com/@arunshaik432/floor-package-notes-app-example-f6c00f2c0bac

@Entity(tableName: 'category', indices: [
  Index(value: ['name'])
])
class CategoryDTO with _$CategoryDTO {
  @PrimaryKey(autoGenerate: true)
  final int id;

  @ColumnInfo(name: 'name')
  final String name;

  CategoryDTO({required this.id, required this.name});
}
