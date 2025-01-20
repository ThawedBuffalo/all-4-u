import 'package:all_4_u/data/mapper/category_entity_mapper.dart';

import '../models/category_model.dart';
import '../../domain/entities/category_entity_list.dart';

class CategoryEntityListMapper {
  static CategoryEntityList transformModelToEntity(
      final CategoryModelList models) {
    final values = models
        .map((model) => CategoryEntityMapper.transformModelToEntity(model))
        .toList();
    return CategoryEntityList(values: values);
  }
}
