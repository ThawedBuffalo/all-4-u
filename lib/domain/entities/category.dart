import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
@HiveType(typeId: 0)
class Category with _$Category {
  Category._();

  factory Category(
      {@HiveField(0) required String name,
      @HiveField(1) required DateTime lastEditDate}) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
