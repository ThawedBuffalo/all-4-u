import '../../domain/entities/person_entity.dart';
import '../models/person_model.dart';

class PersonEntityMapper {
  static PersonEntity transformModelToEntity(final PersonModel model) {
    return PersonEntity(
        id: model['id'],
        firstName: model['firstName'],
        lastName: model['LastName']);
  }

  static PersonModel transformEntityToModelMap(final PersonEntity entity) {
    return {
      'id': entity.id,
      'firstName': entity.firstName,
      'lastName': entity.lastName
    };
  }

  static PersonModel transformToNewModelMap(
      final String firstName, final String lastName) {
    return {'id': null, 'firstName': firstName, 'lastName': lastName};
  }

  static PersonModel transformToModelMap(
      final int id, final String firstName, final String lastName) {
    return {'id': id, 'firstName': firstName, 'lastName': lastName};
  }
}
