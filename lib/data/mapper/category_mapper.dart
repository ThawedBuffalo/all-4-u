import 'package:all_4_u/domain/entities/category_id_entity.dart';

import '../../domain/entities/category_entity.dart';
import '../models/category_model.dart';

class CategoryMapper {
  static CategoryEntity transformToEntity(final CategoryModel model) {
    return CategoryEntity(
        id: CategoryIdEntity(value: model['id']),
        name: model['name'],
        lastEditDate: DateTime.parse(model['lastEditDate']));
  }

  static CategoryModel transformToModelMap(final CategoryEntity entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'lastEditDate': entity.lastEditDate
    };
  }

  static CategoryModel transformToNewModelMap(final String name) {
    final dateNow = DateTime.now();
    return {
      'id': null,
      'name': name,
      'lastEditDate': dateNow.toIso8601String()
    };
  }
}
