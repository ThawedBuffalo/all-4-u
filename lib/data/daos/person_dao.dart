import 'package:all_4_u/data/daos/person_dao_intf.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../database/objectbox.g.dart';
import '../datasources/local_objectbox_datasource.dart';
import 'package:objectbox/objectbox.dart' as objectbox;

import '../dtos/person_dto.dart';

// TODO: leverage generics for one abstract interface

@Injectable(as: PersonDAOInterface)
class PersonDAO implements PersonDAOInterface {
  late final objectbox.Store _store;
  final LocalObjectBoxDataSource dataSource;
  late final Box<PersonDTO> _personBox;

  PersonDAO({required this.dataSource}) {
    _store = dataSource.store;

    // open box
    _personBox = objectbox.Box<PersonDTO>(_store);
  }

  @override
  Future<int> countAll() async {
    final int catCount = _personBox.count();
    return catCount;
  }

  @override
  Future<Either<String, int>> insert(PersonDTO person) async {
    late int result;
    try {
      result = await _personBox.putAsync(person);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> delete(int personId) async {
    Query<PersonDTO> query =
        _store.box<PersonDTO>().query(PersonDTO_.id.equals(personId)).build();
    await query.removeAsync();
    query.close();
  }

  @override
  Future<List<PersonDTO>> findAll() async {
    Query<PersonDTO> query =
        _store.box<PersonDTO>().query().order(PersonDTO_.id).build();
    List<PersonDTO> categories = await query.findAsync();
    query.close();
    return categories;
  }

  @override
  Future<List<PersonDTO>> findOne(int personId) async {
    Query<PersonDTO> query =
        _store.box<PersonDTO>().query(PersonDTO_.id.equals(personId)).build();
    List<PersonDTO> categories = await query.findAsync();
    query.close();
    return categories;
  }

  @override
  void deleteAll() {
    _store.box<PersonDTO>().removeAllAsync();
  }
}
