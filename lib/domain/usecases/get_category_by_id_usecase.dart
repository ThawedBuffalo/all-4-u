import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class GetCategoryByIdUseCase implements UseCase {
  final CategoryRepositoryInterface repository;

  const GetCategoryByIdUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(params) async {
    final result = await repository.getCategoryById(params.categoryId);
    if (result.isLeft()) {
      return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
    }
    return Future.value(result);
  }
}

class Params extends Equatable {
  final int categoryId;

  const Params({required this.categoryId})
      : super();

  @override
  List<Object?> get props => [categoryId];
}
