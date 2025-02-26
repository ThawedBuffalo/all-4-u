import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';
part 'item_entity.g.dart';

@freezed
class ItemEntity with _$ItemEntity {
  factory ItemEntity({
    required int? id,
    required String name,
    required String? description,
    required CategoryEntityList? categoryList,
    required PersonEntityList? personList,
  }) = _ItemEntity;

  factory ItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ItemEntityFromJson(json);
}
