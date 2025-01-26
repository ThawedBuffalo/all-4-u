import '../../domain/entities/item_entity.dart';
import '../models/item_model.dart';

class ItemEntityMapper {
  static ItemEntity transformModelToEntity(final ItemModel item) {
    List<int>? categoryIds;
    if (item['categoryIds'] != null && item['categoryIds'].isNotEmpty) {
      categoryIds = List.from(item['categoryIds']);
    }

    List<int>? personIds;
    if (item['personIds'] != null && item['personIds'].isNotEmpty) {
      personIds = List.from(item['personIds']);
    }

    return ItemEntity(
      id: item['id'],
      name: item['name'],
      description: item['description'],
      categoryIdList: categoryIds,
      personIdList: personIds,
    );
  }

  static ItemModel transformToNewModelMap(
      final String name,
      final String description,
      final List<int> categoryIds,
      final List<int> personIds) {
    return {
      'id': null,
      'name': name,
      'description': description,
      'categoryIds': categoryIds,
      'personIds': personIds
    };
  }
}
