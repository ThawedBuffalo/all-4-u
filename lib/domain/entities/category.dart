import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Category with _$Category {
  const factory Category(
      {required String name, required DateTime lastEditDate}) = _Category;

  Id id = Isar.autoIncrement;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
