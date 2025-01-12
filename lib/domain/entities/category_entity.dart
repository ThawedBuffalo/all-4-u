import 'package:freezed_annotation/freezed_annotation.dart';
import 'category_id_entity.dart';

part 'category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity(
      {required CategoryIdEntity id,
      required String name,
      required DateTime lastEditDate}) = _CategoryEntity;

  const CategoryEntity._();
}
