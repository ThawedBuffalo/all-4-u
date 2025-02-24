import 'package:objectbox/objectbox.dart';

@Entity()
class PersonDTO {
  // id must be 0 for DB to autoincrement
  @Id()
  int id;
  String firstName;
  String lastName;

  PersonDTO(
      {required this.id, required this.firstName, required this.lastName});
}
