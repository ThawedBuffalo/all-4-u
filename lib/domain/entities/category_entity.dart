import 'package:all_4_u/domain/entities/id_int_conv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';
part 'category_entity.g.dart';

/// Issue with default values adn freeezed/jsonserializable:
/// https://github.com/rrousselGit/freezed/issues/149#issuecomment-616098286
/// had to create a default helper file
@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity(
      {@IdIntConv() @Default(IdIntConv.defaultId) @JsonKey() int id,
      required String name}) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);
}
