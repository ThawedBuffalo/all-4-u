import 'package:objectbox/objectbox.dart';

import 'item_dto.dart';

@Entity()
class CategoryDTO {
  // id must be 0 for DB to autoincrement
  @Id()
  int id;
  @Unique()
  String name;

  final items = ToMany<ItemDTO>();

  CategoryDTO({required this.id, required this.name});
}
