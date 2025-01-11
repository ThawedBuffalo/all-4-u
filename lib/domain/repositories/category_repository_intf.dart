import 'package:all_4_u/domain/entities/category.dart';
import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';

abstract class CategoryRepositoryInterface {
  // Future<Either<Failure, Category>> getCategory(String categoryName);
  Future<Either<Failure, Category>> saveCategory(Category categoryToSave);
}
