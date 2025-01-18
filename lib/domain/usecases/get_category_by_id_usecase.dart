import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class GetCategoryByIdUseCase implements UseCase<void, Params> {
  final CategoryRepositoryInterface repository;

  const GetCategoryByIdUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(Params params) async {
    final result = await repository.getCategoryById(params.categoryId);
    return Future.value(result);
  }
}

class Params extends Equatable {
  final int categoryId;

  const Params({required this.categoryId}) : super();

  @override
  List<Object?> get props => [categoryId];
}
