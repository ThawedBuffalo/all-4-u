import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity_id.freezed.dart';
part 'category_entity_id.g.dart';

@freezed
class CategoryEntityId with _$CategoryEntityId {
  const factory CategoryEntityId({required int id}) = _CategoryEntityId;
  factory CategoryEntityId.fromJson(Map<String, Object?> json) =>
      _$CategoryEntityIdFromJson(json);
}
