import 'package:dartz/dartz.dart';
import '../dtos/category_dto.dart';

abstract class CategoryDAOInterface {
  Future<List<CategoryDTO>> findOne(int categoryId);
  Future<List<CategoryDTO>> findAll();
  Future<Either<String, int>> insert({required CategoryDTO category});
  Future<void> delete(int categoryId);
  Future<void> deleteAll();
  Future<int> countAll();
}
