import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryDTO {
  @Id()
  int? id = 0;
  @Unique()
  String name;

  CategoryDTO({required this.name});
}
