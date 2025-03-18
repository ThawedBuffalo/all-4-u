import 'package:all_4_u/core/error/failure.dart';
import 'package:all_4_u/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import '../repositories/person_repository_intf.dart';

class DeleteAllPeopleUsecase implements UseCase<void, NoParams> {
  final PersonRepositoryInterface repository;

  const DeleteAllPeopleUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    repository.deleteAllPeople();
    return const Right(null);
  }
}
