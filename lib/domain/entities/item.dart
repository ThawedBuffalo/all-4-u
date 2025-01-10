import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:all_4_u/domain/entities/category.dart';
import 'package:all_4_u/domain/entities/person.dart';
import 'package:isar/isar.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
sealed class Item with _$Item {
  const factory Item(
      {required String name,
      String? description,
      required DateTime lastEditDate,
      List<Category>? categoryList,
      List<Person>? personList,
      String? notes,
      String? imageFilenameWPath,
      String? audioFilenameWPath}) = _Item;

  Id id = Isar.autoIncrement;

  static Item temp = Item(name: 'tbd', lastEditDate: DateTime.now());

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
