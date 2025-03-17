import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class UpdateCategoryUseCase implements UseCase<void, UpdateCategoryParams> {
  final CategoryRepositoryInterface repository;

  const UpdateCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(UpdateCategoryParams params) async {
    if (params.props == null) {
      // error - no params
      return Future.value(Left(EmptyParams(errorMessage: PARAM_ERROR)));
    }
    final result = await repository.updateCategory(
        category:
            CategoryEntity(id: params.categoryId, name: params.categoryName));
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class UpdateCategoryParams extends Equatable {
  final int categoryId;
  final String categoryName;

  const UpdateCategoryParams(
      {required this.categoryId, required this.categoryName})
      : super();

  @override
  List<Object?> get props => [categoryId, categoryName];
}
