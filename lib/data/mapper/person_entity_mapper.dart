import 'package:all_4_u/data/dtos/person_dto.dart';

import '../../domain/entities/person_entity.dart';

class PersonEntityMapper {
  static PersonEntity transformDTOToEntity(final PersonDTO dto) {
    return PersonEntity(
        id: dto.id, firstName: dto.firstName, lastName: dto.lastName);
  }

  static PersonDTO transformEntityToDTO(final PersonEntity entity) {
    return PersonDTO(
        id: entity.id, firstName: entity.firstName, lastName: entity.lastName);
  }

  static PersonDTO transformToNewDTO(
      final String firstName, final String lastName) {
    return PersonDTO(id: 0, firstName: firstName, lastName: lastName);
  }

  static PersonDTO transformToDTO(
      final int id, final String firstName, final String lastName) {
    return PersonDTO(id: id, firstName: firstName, lastName: lastName);
  }
}
