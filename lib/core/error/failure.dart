import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class PlaceholderFailure extends Failure {
  final String errorMessage;

  PlaceholderFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class DBFailure extends Failure {
  final String errorMessage;

  DBFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
