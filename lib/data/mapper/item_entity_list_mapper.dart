import '../../domain/entities/item_entity_list.dart';
import '../dtos/item_dto.dart';
import 'item_entity_mapper.dart';

class ItemEntityListMapper {
  static ItemEntityList transformDTOListToEntityList(
      final List<ItemDTO> itemDTOs) {
    final values = itemDTOs
        .map((dto) => ItemEntityMapper.transformDTOToEntity(dto))
        .toList();
    return ItemEntityList(values: values);
  }
}
