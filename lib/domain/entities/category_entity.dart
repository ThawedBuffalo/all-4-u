import 'package:objectbox/objectbox.dart';

@Entity()
class CategoryEntity {
  @Id()
  int? id = 0;
  String name;

  CategoryEntity({required this.id, required this.name});
}
