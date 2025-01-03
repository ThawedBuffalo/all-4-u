part of 'example_bloc.dart';

abstract class ExampleState extends Equatable {
  const ExampleState();
}

class ExampleInitial extends ExampleState {
  @override
  List<Object> get props => [];
}
