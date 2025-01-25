import '../../domain/entities/item_entity.dart';
import '../models/item_model.dart';

class ItemEntityMapper {
  // https://www.oreilly.com/library/view/flutter-and-dart/9781098119508/ch04.html


  // static ItemEntity transformModelToEntity(final ItemModel model) {
  //   // map the Category list
  //   final categoryListModels = model.categoryEntityList;
  //   final values = models
  //       .map((model) => ItemEntityMapper.transformModelToEntity(model))
  //       .toList();
  //
  //   return ItemEntity(
  //       id: model['id'],
  //       name: model['name'],
  //       description: model['description'],
  //       categoryEntityList: [],
  //       personEntityList: []);
  //
  //   // required List<CategoryEntity> categoryEntityList,
  //   // required List<PersonEntity> personEntityList,
  // }

  static ItemModel transformEntityToModelMap(final ItemEntity entity) {
    return {'id': entity.id, 'name': entity.name};
  }

  static ItemModel transformToNewModelMap(final String name) {
    return {'id': null, 'name': name};
  }

  static ItemModel transformToModelMap(
      final int id, final String categoryName) {
    return {'id': id, 'name': categoryName};
  }
}
