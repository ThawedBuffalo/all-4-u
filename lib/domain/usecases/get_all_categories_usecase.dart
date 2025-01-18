import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:all_4_u/data/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/error_messages.dart';
import '../repositories/category_repository_intf.dart';

class GetAllCategoriesUsecase implements UseCase {
  final CategoryRepositoryInterface repository;

  const GetAllCategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) async {
    final result = await repository.getAllCategories();
    return Future.value(result);
  }
}
