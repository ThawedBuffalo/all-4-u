import 'package:all_4_u/data/dtos/person_dto.dart';
import 'package:all_4_u/domain/usecases/delete_all_categories_usecase.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDAO {
  @Query('SELECT * FROM person')
  Future<List<PersonDTO?>> findAllPeople();

  @Query('SELECT * FROM person WHERE id = :id')
  Future<PersonDTO?> findPersonByID(int id);

  @insert
  Future<void> insertPerson(PersonDTO personDTO);

  @update
  Future<void> updatePerson(PersonDTO personDTO);

  @delete
  Future<void> deletePerson(PersonDTO personDTO);
}
