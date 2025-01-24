import '../../domain/entities/item_entity.dart';
import '../models/item_model.dart';

class ItemEntityMapper {
  static ItemEntity transformModelToEntity(final ItemModel model) {

    // map the Category list
    final categoryList = model.
    final values = models
        .map((model) => CategoryEntityMapper.transformModelToEntity(model))
        .toList();

    return ItemEntity(id: model['id'], name: model['name'],
        description: model['description'], categoryEntityList: [], personEntityList: []);

    // required List<CategoryEntity> categoryEntityList,
    // required List<PersonEntity> personEntityList,
  }

  static CategoryModel transformEntityToModelMap(final CategoryEntity entity) {
    return {'id': entity.id, 'name': entity.name};
  }

  static CategoryModel transformToNewModelMap(final String name) {
    return {'id': null, 'name': name};
  }

  static CategoryModel transformToModelMap(
      final int id, final String categoryName) {
    return {'id': id, 'name': categoryName};
  }
}
