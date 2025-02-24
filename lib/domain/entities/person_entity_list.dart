import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_entity_list.freezed.dart';
part 'person_entity_list.g.dart';

@freezed
class PersonEntityList with _$PersonEntityList {
  const factory PersonEntityList({required List<PersonEntity> values}) =
      _PersonEntityList;

  const PersonEntityList._();

  factory PersonEntityList.fromJson(Map<String, Object?> json) =>
      _$PersonEntityListFromJson(json);

  // operator [](final int index) => values[index];
  // int get length => values.length;
  //
  // PersonEntityList addPersonEntity(final PersonEntity entity) =>
  //     copyWith(values: [...values, entity]);
  //
  // PersonEntityList updatePersonEntity(final PersonEntity newEntity) {
  //   return copyWith(
  //       values: values
  //           .map((entity) => newEntity.id == entity.id ? newEntity : entity)
  //           .toList());
  // }
  //
  // PersonEntityList removePersonEntityById(final int id) =>
  //     copyWith(values: values.where((entity) => entity.id != id).toList());
}
