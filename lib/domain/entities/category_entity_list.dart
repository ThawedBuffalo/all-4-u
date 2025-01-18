import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_entity_list.freezed.dart';
part 'category_entity_list.g.dart';

@freezed
class CategoryEntityList with _$CategoryEntityList {
  const factory CategoryEntityList({required List<CategoryEntity> values}) =
      _CategoryEntityList;

  const CategoryEntityList._();

  factory CategoryEntityList.fromJson(Map<String, Object?> json) =>
      _$CategoryEntityListFromJson(json);

  operator [](final int index) => values[index];
  int get length => values.length;

  CategoryEntityList addCategoryEntity(final CategoryEntity entity) =>
      copyWith(values: [...values, entity]);

  CategoryEntityList updateCategoryEntity(final CategoryEntity newEntity) {
    return copyWith(
        values: values
            .map((entity) => newEntity.id == entity.id ? newEntity : entity)
            .toList());
  }

  CategoryEntityList removeCategoryEntityById(final int id) =>
      copyWith(values: values.where((entity) => entity.id != id).toList());
}
