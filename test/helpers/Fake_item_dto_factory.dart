import 'package:all_4_u/data/dtos/category_dto.dart';
import 'package:all_4_u/data/dtos/item_dto.dart';
import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/data/mapper/category_entity_list_mapper.dart';
import 'package:all_4_u/data/mapper/item_entity_list_mapper.dart';
import 'package:all_4_u/data/mapper/item_entity_mapper.dart';
import 'package:all_4_u/data/mapper/person_entity_list_mapper.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/category_entity_list.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:all_4_u/domain/entities/item_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'package:all_4_u/domain/entities/person_entity_list.dart';
import 'Fake_category_dto_factory.dart';
import 'Fake_person_dto_factory.dart';
import 'fake_dto_creator_intf.dart';

class FakeItemDTOFactory extends FakeDataCreatorIntf<ItemDTO> {
  FakeCategoryDTOFactory categoryDTOFactory = FakeCategoryDTOFactory();
  FakePersonDTOFactory personDTOFactory = FakePersonDTOFactory();

  /// generate full item test instance
  @override
  generateFake() {
    List<CategoryDTO> categoryList = [];
    List<PersonDTO> personList = [];

    for (int i = 0; i < 1; i++) {
      categoryList.add(categoryDTOFactory.generateFake());
    }

    for (int i = 0; i < 3; i++) {
      personList.add(personDTOFactory.generateFake());
    }

    ItemDTO itemDTO = ItemDTO(
        id: createFakeId(),
        name: faker.person.name(),
        description: faker.person.name());

    itemDTO.categories.addAll(categoryList);
    itemDTO.people.addAll(personList);
    return itemDTO;
  }

  generateFakeWithNoCategoriesNoPeople() {
    return ItemDTO(
        id: createFakeId(),
        name: faker.person.name(),
        description: faker.person.name());
  }

  generateFakeWithNoCategories() {
    List<PersonDTO> personList = [];

    for (int i = 0; i < 3; i++) {
      personList.add(personDTOFactory.generateFake());
    }

    ItemDTO itemDTO = ItemDTO(
        id: createFakeId(),
        name: faker.person.name(),
        description: faker.person.name());

    itemDTO.people.addAll(personList);
    return itemDTO;
  }

  generateFakeWithNoPeople() {
    List<CategoryDTO> categoryList = [];

    for (int i = 0; i < 1; i++) {
      categoryList.add(categoryDTOFactory.generateFake());
    }

    ItemDTO itemDTO = ItemDTO(
        id: createFakeId(),
        name: faker.person.name(),
        description: faker.person.name());

    itemDTO.categories.addAll(categoryList);
    return itemDTO;
  }

  @override
  List<ItemDTO> generateFakeList({required int length}) {
    List<ItemDTO> itemDTOList = [];

    for (int i = 0; i < length; i++) {
      ItemDTO itemDTO = generateFake();
      itemDTOList.add(itemDTO);
    }

    return itemDTOList;
  }

  ItemEntityList generateFakeEntityList({required List<ItemDTO> dtoList}) {
    return ItemEntityListMapper.transformDTOListToEntityList(dtoList);
  }

  ItemEntity generateFakeEntity(ItemDTO dto) {
    //
    return ItemEntityMapper.transformDTOToEntity(dto);
  }
}
