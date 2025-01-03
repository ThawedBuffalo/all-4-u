import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/placeholder.dart';

abstract class PlaceholderRepositoryInterface {
  Future<Either<Failure, Placeholder>> getPlaceholderDataWithParams(
      String placeholderParam);

  Future<Either<Failure, Placeholder>> getPlaceholderDataWithoutParams();
}
