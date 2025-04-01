import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/error_messages.dart';
import '../repositories/item_repository_intf.dart';

class GetItemByIdUseCase implements UseCase<void, GetItemByIdParams> {
  final ItemRepositoryInterface repository;

  const GetItemByIdUseCase(this.repository);

  @override
  Future<Either<Failure, dynamic>> call(GetItemByIdParams params) async {
    if (params.props == null) {
      // error - no params
      return Future.value(Left(EmptyParams(errorMessage: PARAM_ERROR)));
    }

    final result = await repository.getItemById(id: params.itemId);
    return Future.value(result);
  }
}

class GetItemByIdParams extends Equatable {
  final int itemId;

  const GetItemByIdParams({required this.itemId}) : super();

  @override
  List<Object?> get props => [itemId];
}
