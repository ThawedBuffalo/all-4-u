import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:all_4_u/core/error/error_messages.dart';
import 'package:all_4_u/domain/repositories/category_repository_intf.dart';

class CreateCategoryUseCase implements UseCase<void, Params> {
  final CategoryRepositoryInterface repository;

  const CreateCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(Params params) async {
    /// expect params to be a String: category name
    if (params.props == null) {
      // error - no params
      return Future.value(Left(EmptyParams(errorMessage: PARAM_ERROR)));
    }

    CategoryEntity category = CategoryEntity(name: params.categoryName);
    final result = await repository.createCategory(category: category);
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class Params extends Equatable {
  final String categoryName;

  const Params({required this.categoryName}) : super();

  @override
  List<Object?> get props => [categoryName];
}
