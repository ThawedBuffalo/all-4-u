import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../entities/category_entity.dart';

abstract class CategoryRepositoryInterface {
  Future<Either<Failure, CategoryEntity>> insertCategory(final String name);
  // Future<void> updateCategory(final CategoryIdEntity id, final String name);
  // Future<void> deleteCategory(final CategoryIdEntity id);
}
