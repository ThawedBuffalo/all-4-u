import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class DeleteCategoryByIdUsecase implements UseCase<void, DelParams> {
  final CategoryRepositoryInterface repository;

  const DeleteCategoryByIdUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(DelParams params) async {
    if (params.props == null) {
      // error - no params
      return Future.value(Left(EmptyParams(errorMessage: PARAM_ERROR)));
    }
    repository.deleteCategoryById(categoryId: params.categoryId);
    return const Right(null);
  }
}

class DelParams extends Equatable {
  final int categoryId;

  const DelParams({required this.categoryId}) : super();

  @override
  List<Object?> get props => [categoryId];
}
