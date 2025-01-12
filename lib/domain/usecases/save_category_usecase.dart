import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/category_entity.dart';
import '../repositories/category_repository_intf.dart';

class SaveCategoryUseCase implements UseCase {
  final CategoryRepositoryInterface repository;

  SaveCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, dynamic>> call(params) async {
  //   final result = await repository.saveSettings(params.);
  //   if (result.isLeft()) {
  //     return Left(LocalStorageFailure(errorMessage: SETTINGS_STORE_FAILURE));
  //   }
  //   return const Right(null);
  // }
}

class Params extends Equatable {
  final Category userCategory;

  const Params({required this.userCategory}) : super();

  @override
  List<Object?> get props => [userCategory];
}
