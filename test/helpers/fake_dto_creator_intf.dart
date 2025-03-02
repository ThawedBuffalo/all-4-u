import 'package:faker/faker.dart';
import 'dart:math';

abstract class FakeDataCreatorIntf<T> {
  Faker get faker => Faker();

  /// Create a fake random int ID
  int createFakeId() {
    Random random = Random();
    int fakeId = random.nextInt(99) + 1;
    return fakeId;
  }

  /// Generate a single fake model
  T generateFake();
  T generateFakeFrom();

  /// Generate a fake list of models based on length
  List<T> generateFakeList({required int length});
  List<T> generateFakeListFrom();
}
