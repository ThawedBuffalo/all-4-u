import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category_entity.freezed.dart';
part 'category_entity.g.dart';

@freezed
class CategoryEntity with _$CategoryEntity {

  const factory CategoryEntity({required int id, required String name}) =
      _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, Object?> json) =>
      _$CategoryEntityFromJson(json);
}
