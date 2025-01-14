import 'package:all_4_u/domain/entities/category_id_entity.dart';

import '../../domain/entities/category_entity.dart';
import '../models/category_model.dart';

class CategoryMapper {
  static CategoryEntity transformToEntity(final CategoryModel model) {
    return CategoryEntity(
        id: CategoryIdEntity(value: model['id']),
        name: model['name'],
        lastEditDate: model['lastEditDate']);
  }

  static CategoryModel transformToModelMap(
      final String name, final DateTime time) {
    return {'id': null, 'name': name, 'lastEditDate': time};
  }

  static CategoryModel transformToNewModelMap(
      final String name, final DateTime dateNow) {
    return {
      'id': null,
      'name': name,
      'lastEditDate': dateNow.toIso8601String()
    };
  }
}
