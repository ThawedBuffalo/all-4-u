import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import '../../data/models/category_model.dart';
import '../entities/category_entity.dart';
import '../entities/category_id_entity.dart';

abstract class CategoryRepositoryInterface {
  Future<Either<Failure, CategoryEntity>> insertCategory(
      final String name, final DateTime dateNow);
  Future<void> updateCategory(final CategoryIdEntity id, final String name);
  Future<void> deleteCategory(final CategoryIdEntity id);
}
