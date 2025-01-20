import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class UpdateCategoryUseCase implements UseCase<void, UpdateParams> {
  final CategoryRepositoryInterface repository;

  const UpdateCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(UpdateParams params) async {
    final result = await repository.insertCategory(params.categoryName);
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class UpdateParams extends Equatable {
  final int categoryId;
  final String categoryName;

  const UpdateParams({required this.categoryId, required this.categoryName})
      : super();

  @override
  List<Object?> get props => [categoryId, categoryName];
}
