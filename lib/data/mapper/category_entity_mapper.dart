import '../../domain/entities/category_entity.dart';
import '../dtos/category_dto.dart';

class CategoryEntityMapper {
  static CategoryEntity transformDTOToEntity(final CategoryDTO dto) {
    return CategoryEntity(id: dto.id, name: dto.name);
  }

  static CategoryDTO transformEntityToDTO(final CategoryEntity entity) {
    return CategoryDTO(id: entity.id, name: entity.name);
  }

  static CategoryDTO transformToNewDTO(final String name) {
    return CategoryDTO(id: 0, name: name);
  }

  static CategoryDTO transformToDTO(final int id, final String categoryName) {
    return CategoryDTO(id: id, name: categoryName);
  }
}
