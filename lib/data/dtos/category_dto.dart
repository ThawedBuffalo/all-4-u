import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryDTO {
  // id must be 0 for DB to autoincrement
  @Id()
  int id;
  @Unique()
  String name;

  CategoryDTO({required this.id, required this.name});
}
