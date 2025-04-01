import 'package:freezed_annotation/freezed_annotation.dart';

import 'id_int_conv.dart';

part 'person_entity.freezed.dart';
part 'person_entity.g.dart';

@freezed
class PersonEntity with _$PersonEntity {
  const factory PersonEntity(
      {@IdIntConv() @Default(IdIntConv.defaultId) @JsonKey() int id,
      required String firstName,
      required String lastName}) = _PersonEntity;
  factory PersonEntity.fromJson(Map<String, dynamic> json) =>
      _$PersonEntityFromJson(json);
}
