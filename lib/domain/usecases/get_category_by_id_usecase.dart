import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class GetCategoryByIdUseCase implements UseCase<void, Params> {
  final CategoryRepositoryInterface repository;

  const GetCategoryByIdUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(Params params) async {
    if (params.props == null) {
      // error - no params
      return Future.value(Left(EmptyParams(errorMessage: PARAM_ERROR)));
    }
    final result = await repository.getCategoryById(id: params.categoryId);
    return Future.value(result);
  }
}

class Params extends Equatable {
  final int categoryId;

  const Params({required this.categoryId}) : super();

  @override
  List<Object?> get props => [categoryId];
}
