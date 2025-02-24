import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_entity.freezed.dart';
part 'person_entity.g.dart';

@freezed
class PersonEntity with _$PersonEntity {
  const factory PersonEntity(
      {required int id,
      required String firstName,
      required String lastName}) = _PersonEntity;

  factory PersonEntity.fromJson(Map<String, dynamic> json) =>
      _$PersonEntityFromJson(json);
}
