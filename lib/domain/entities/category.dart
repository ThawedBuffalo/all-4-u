import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  Category._();

  @HiveType(typeId: 0)
  factory Category({
    required int id,
    required String name,
    required DateTime lastEditDate,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
