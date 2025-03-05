import 'package:all_4_u/data/dtos/item_dto.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:all_4_u/domain/entities/item_entity.dart';
import 'package:all_4_u/domain/entities/item_entity_list.dart';
import 'package:all_4_u/domain/entities/person_entity.dart';
import 'fake_dto_creator_intf.dart';

class FakeItemDTOFactory extends FakeDataCreatorIntf<ItemDTO> {
  /// generate full item test instance
  @override
  generateFake() {
    return ItemDTO(
        id: createFakeId(),
        name: faker.person.name(),
        description: faker.person.name());
  }

  @override
  List<ItemDTO> generateFakeList({required int length}) {
    return List.generate(length, (index) => generateFake());
  }

  ItemEntityList generateFakeEntityList({required List<ItemDTO> dtoList}) {
    // loop through dto list and create entities for each
    final values = dtoList
        .map((dto) => ItemEntity(
            id: dto.id,
            name: dto.name,
            description: dto.description,
            personList: null,
            categoryList: null))
        .toList();

    // add categories
    //CategoryEntityList catList = CategoryEntityList();
    for (int i = 0; i < dtoList.length; i++) {
      dtoList[0].categories.map((category) => values[i]
          .categoryList!
          .addCategoryEntity(
              CategoryEntity(id: category.id, name: category.name)));
    }

    // add persons
    for (int i = 0; i < dtoList.length; i++) {
      dtoList[0].people.map((person) => values[i].personList!.addPersonEntity(
          PersonEntity(
              id: person.id,
              firstName: person.firstName,
              lastName: person.lastName)));
    }

    return ItemEntityList(values: values);
  }

  ItemEntity generateFakeEntity(ItemDTO dto) {
    ItemEntity entity = ItemEntity(
        id: dto.id,
        name: dto.name,
        description: dto.description,
        categoryList: null,
        personList: null);

    for (int i = 0; i < dto.categories.length; i++) {
      entity.categoryList!.addCategoryEntity(CategoryEntity(
          id: dto.categories[i].id, name: dto.categories[i].name));
    }

    for (int i = 0; i < dto.people.length; i++) {
      entity.personList!.addPersonEntity(PersonEntity(
          id: dto.people[i].id,
          firstName: dto.people[i].firstName,
          lastName: dto.people[i].lastName));
    }

    return entity;
  }
}
