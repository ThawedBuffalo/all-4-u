import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../entities/category_entity.dart';
import '../repositories/category_repository_intf.dart';

class CreateCategoryUseCase implements UseCase {
  final CategoryRepositoryInterface repository;

  CreateCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    final result = await repository.createCategory(params);
    if (result.isLeft()) {
      return Left(DBFailure(errorMessage: DB_INSERT_FAILURE));
    }
    return const Right(null);
  }
}

class Params extends Equatable {
  final String categoryName;

  const Params({required this.categoryName}) : super();

  @override
  List<Object?> get props => [categoryName];
}
