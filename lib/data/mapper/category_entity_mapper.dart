import '../../domain/entities/category_entity.dart';
import '../models/category_model.dart';

class CategoryEntityMapper {
  static CategoryEntity transformToEntity(final CategoryModel model) {
    return CategoryEntity(id: model['id'], name: model['name']);
  }

  static CategoryModel transformToModelMap(final CategoryEntity entity) {
    return {'id': entity.id, 'name': entity.name};
  }

  static CategoryModel transformToNewModelMap(final name) {
    return {'id': null, 'name': name};
  }
}
