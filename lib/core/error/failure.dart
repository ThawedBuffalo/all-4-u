import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class DBFailure extends Failure {
  final String errorMessage;

  DBFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class DBEmptyResult extends Failure {
  final String errorMessage;

  DBEmptyResult({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class EmptyParams extends Failure {
  final String errorMessage;

  EmptyParams({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
