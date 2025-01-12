import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_id_entity.freezed.dart';

@freezed
class CategoryIdEntity with _$CategoryIdEntity {
  const factory CategoryIdEntity({required int value}) = _CategoryIdEntity;
}
