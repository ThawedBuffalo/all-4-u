import 'package:all_4_u/data/mapper/category_entity_list_mapper.dart';
import 'package:all_4_u/data/mapper/person_entity_list_mapper.dart';
import '../../domain/entities/item_entity.dart';
import '../dtos/item_dto.dart';

class ItemEntityMapper {
  static ItemEntity transformDTOToEntity(final ItemDTO item) {
    return ItemEntity(
        id: item.id,
        name: item.name,
        description: item.description,
        categoryList: CategoryEntityListMapper.transformDTOListToEntityList(
            item.categories),
        personList:
            PersonEntityListMapper.transformDTOListToEntityList(item.people));
  }

  static ItemDTO transformEntityToDTO(final ItemEntity entity) {
    ItemDTO itemDTO = ItemDTO(id: entity.id, name: entity.name,
        description: entity.description);

    if (entity.categoryList != null) {

    }
    //for (int i = 0; i < entity.categoryList.length; i++ )

  }

}
