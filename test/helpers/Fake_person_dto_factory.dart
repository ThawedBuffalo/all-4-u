import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';

import 'fake_dto_creator_intf.dart';

class FakePersonDTOFactory extends FakeDataCreatorIntf<PersonDTO> {
  @override
  generateFake() {
    return PersonDTO(id: createFakeId(),
        firstName: faker.person.firstName(), lastName: faker.person.lastName());
  }

  @override
  List<PersonDTO> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }

  PersonEntityList generateFakeEntityList(
      {required List<PersonDTO> dtoList}) {
    // loop through dto list and create entities for each
    final values = dtoList
        .map((dto) => PersonEntity(id: dto.id,
        firstName: dto.firstName, lastName: dto.lastName))
        .toList();
    return PersonEntityList(values: values);
  }

  PersonEntity generateFakeEntity(PersonDTO dto) {
    return PersonEntity(id: dto.id,
        firstName: dto.firstName, lastName: dto.lastName);
  }
}
