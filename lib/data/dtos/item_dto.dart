import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:objectbox/objectbox.dart';

import '../../domain/entities/category_entity_list.dart';
import '../../domain/entities/person_entity_list.dart';
import 'category_dto.dart';

@Entity()
class ItemDTO {
  // id must be 0 for DB to autoincrement
  @Id()
  int id;
  @Unique()
  String name;
  String? description;
  // CategoryEntityList? categoryList;
  // PersonEntityList? personList;
  //public List<Teacher> teachers = new ToMany<>(this, Student_.teachers);

  final categories = ToMany<CategoryDTO>();
  final people = ToMany<PersonDTO>();

  // ItemDTO({required this.id, required this.name,
  //   this.description, this.categoryList, this.personList});
  ItemDTO({required this.id, required this.name, this.description});
}
