import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:dartz/dartz_unsafe.dart';

import 'fake_dto_creator_intf.dart';

class FakeCategoryDTOFactory extends FakeDataCreatorIntf<CategoryDTO> {
  @override
  generateFake() {
    return CategoryDTO(id: createFakeId(), name: faker.person.lastName());
  }

  @override
  List<CategoryDTO> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }

  CategoryEntityList generateFakeEntityList(
      {required List<CategoryDTO> dtoList}) {
    // loop through dto list and create entities for each
    final values = dtoList
        .map((dto) => CategoryEntity(id: dto.id, name: dto.name))
        .toList();
    return CategoryEntityList(values: values);
  }
}
