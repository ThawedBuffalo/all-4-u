import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';

import 'category_entity.dart';

part 'item_entity.freezed.dart';
part 'item_entity.g.dart';

@freezed
class ItemEntity with _$ItemEntity {

  factory ItemEntity({
    required int id,
    required String name,
    required String description,
    required List<CategoryEntity> categoryEntityList,
    required List<PersonEntity> personEntityList,
  }) = _ItemEntity;

  factory ItemEntity.fromJson(Map<String, dynamic> json) => _$ItemEntityFromJson(json);
}