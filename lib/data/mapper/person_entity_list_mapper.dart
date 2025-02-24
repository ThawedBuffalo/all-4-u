import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/data/mapper/person_entity_mapper.dart';
import '../../domain/entities/person_entity_list.dart';

class PersonEntityListMapper {
  static PersonEntityList transformModelToEntity(
      final List<PersonDTO> personDTOs) {
    final values = personDTOs
        .map((dto) => PersonEntityMapper.transformDTOToEntity(dto))
        .toList();
    return PersonEntityList(values: values);
  }
}
