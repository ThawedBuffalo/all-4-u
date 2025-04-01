import 'package:dartz/dartz.dart';

// ref: https://stackoverflow.com/questions/58734044/how-to-extract-left-or-right-easily-from-either-type-in-dart-dartz
extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value;

  L asLeft() => (this as Left).value;
}
