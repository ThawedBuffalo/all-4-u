import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/item_entity.dart';

abstract class ItemRepositoryInterface {
  Future<Either<Failure, ItemEntity>> insertItem(final String name,
      String description, List<int> categoryIds, List<int> personIds);
  // Future<Either<Failure, PersonEntity>> getPersonById(final int id);
  // Future<Either<Failure, PersonEntityList>> getAllPeople();
  // Future<Either<Failure, PersonEntity>> updatePerson(
  //     final int id, final String firstName, String personLastName);
  // Future<void> deletePersonById(final int id);
  // Future<void> deleteAllPeople();
}
