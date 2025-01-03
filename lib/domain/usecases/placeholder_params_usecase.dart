import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/placeholder_repository_intf.dart';

const String PLACEHOLDER_FAILURE = 'some error message...';

class PlaceholderParamsUseCase implements UseCase<void, Params> {
  final PlaceholderRepositoryInterface repository;

  PlaceholderParamsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) async {
    final result =
        await repository.getPlaceholderDataWithParams(params as String);
    if (result.isLeft()) {
      return Left(PlaceholderFailure(errorMessage: PLACEHOLDER_FAILURE));
    }
    return const Right(null);
  }
}

class Params extends Equatable {
  final String placeHolderParam;
  const Params({required this.placeHolderParam}) : super();

  @override
  List<Object?> get props => [placeHolderParam];
}
