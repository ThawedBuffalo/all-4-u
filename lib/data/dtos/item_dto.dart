import 'package:objectbox/objectbox.dart';

import '../../domain/entities/category_entity_list.dart';
import '../../domain/entities/person_entity_list.dart';

@Entity()
class ItemDTO {
  // id must be 0 for DB to autoincrement
  @Id()
  int id;
  @Unique()
  String name;
  String? description;
  CategoryEntityList? categoryList;
  PersonEntityList? personList;

  ItemDTO({required this.id, required this.name,
    this.description, this.categoryList, this.personList});
}
