import 'package:all_4_u/domain/entities/category_entity.dart';

// NOTE: can't extend object or generics for interface in function params

abstract class DaoInterface {
  Future<List<Object?>> findAll();
  Future<Object?> findOne(int id);
  Future<Object?> insert<T>(T value);
  Future<Object?> update(Object dto);
  Future<Object?> deleteOne(Object dto);
  Future<Object?> deleteAll();
}
