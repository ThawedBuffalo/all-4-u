import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:all_4_u/domain/entities/person.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  Item._();

  factory Item({
    required int id,
    required String name,
    required String description,
    required DateTime lastEditDate,
    required List<Category> categoryList,
    required List<Person> personList,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
