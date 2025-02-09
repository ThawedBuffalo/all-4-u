// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/core/usecases/usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../core/error/error_messages.dart';
// import '../repositories/item_repository_intf.dart';
//
// class CreateUnassignedItemUseCase
//     implements UseCase<void, CreateUnAssItemParams> {
//   final ItemRepositoryInterface repository;
//
//   const CreateUnassignedItemUseCase(this.repository);
//
//   @override
//   Future<Either<Failure, dynamic>> call(CreateUnAssItemParams params) async {
//     final result = await repository.insertUnassignedItem(
//         params.name, params.description, params.categoryIds);
//     if (result.isLeft()) {
//       return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//     }
//     return Future.value(result);
//   }
// }
//
// class CreateUnAssItemParams extends Equatable {
//   final String name;
//   final String description;
//   final List<int> categoryIds;
//
//   const CreateUnAssItemParams(
//       {required this.name,
//       required this.description,
//       required this.categoryIds})
//       : super();
//
//   @override
//   List<Object?> get props => [name, description, categoryIds];
// }
