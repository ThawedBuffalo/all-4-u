import 'package:faker/faker.dart';
import 'dart:math';

abstract class FakeEntityCreatorIntf<T> {
  /// Generate a single fake model
  T generateFakeFrom();

  /// Generate a fake list of models based on length
  List<T> generateFakeListFrom();
}
