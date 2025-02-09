// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';
//
// import 'item_entity.dart';
//
// part 'item_entity_list.freezed.dart';
// part 'item_entity_list.g.dart';
//
// @freezed
// class ItemEntityList with _$ItemEntityList {
//   const factory ItemEntityList({required List<ItemEntity> values}) =
//       _ItemEntityList;
//
//   const ItemEntityList._();
//
//   factory ItemEntityList.fromJson(Map<String, Object?> json) =>
//       _$ItemEntityListFromJson(json);
//
//   operator [](final int index) => values[index];
//   int get length => values.length;
//
//   ItemEntityList addItemEntity(final ItemEntity entity) =>
//       copyWith(values: [...values, entity]);
//
//   ItemEntityList updateItemEntity(final ItemEntity newEntity) {
//     return copyWith(
//         values: values
//             .map((entity) => newEntity.id == entity.id ? newEntity : entity)
//             .toList());
//   }
//
//   ItemEntityList removeItemEntityById(final int id) =>
//       copyWith(values: values.where((entity) => entity.id != id).toList());
// }
