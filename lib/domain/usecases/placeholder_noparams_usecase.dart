import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/placeholder_repository_intf.dart';

const String PLACEHOLDER_FAILURE = 'some error message...';

class PlaceholderNoParamsUseCase implements UseCase<void, NoParams> {
  final PlaceholderRepositoryInterface repository;

  PlaceholderNoParamsUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await repository.getPlaceholderDataWithoutParams();
    if (result.isLeft()) {
      return Left(PlaceholderFailure(errorMessage: PLACEHOLDER_FAILURE));
    }
    return const Right(null);
  }
}
