// import 'package:all_4_u/core/error/failure.dart';
// import 'package:all_4_u/core/usecases/usecase.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../core/error/error_messages.dart';
// import '../repositories/item_repository_intf.dart';
//
// class CreateNamedItemUseCase implements UseCase<void, CreateNamedItemParams> {
//   final ItemRepositoryInterface repository;
//
//   const CreateNamedItemUseCase(this.repository);
//
//   @override
//   Future<Either<Failure, dynamic>> call(CreateNamedItemParams params) async {
//     final result = await repository.insertNamedItem(params.name);
//     if (result.isLeft()) {
//       return Future.value(Left(DBFailure(errorMessage: DB_INSERT_FAILURE)));
//     }
//     return Future.value(result);
//   }
// }
//
// class CreateNamedItemParams extends Equatable {
//   final String name;
//
//   const CreateNamedItemParams({required this.name}) : super();
//
//   @override
//   List<Object?> get props => [name];
// }
