// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/core/usecases/usecase.dart';
// import 'package:all_4_u/data/repositories/category_repository.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../core/error/error_messages.dart';
// import '../repositories/category_repository_intf.dart';
//
// class CreateCategoryUseCase implements UseCase<void, Params> {
//   final CategoryRepositoryInterface repository;
//
//   const CreateCategoryUseCase(this.repository);
//
//   @override
//   Future<Either<Failure, dynamic>> call(Params params) async {
//     final result = await repository.insertCategory(params.categoryName);
//     if (result.isLeft()) {
//       return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//     }
//     return Future.value(result);
//   }
// }
//
// class Params extends Equatable {
//   final String categoryName;
//
//   const Params({required this.categoryName}) : super();
//
//   @override
//   List<Object?> get props => [categoryName];
// }
