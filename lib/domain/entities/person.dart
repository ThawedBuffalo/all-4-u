import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
@HiveType(typeId: 1)
class Person with _$Person {
  Person._();

  factory Person(
      {@HiveField(0) required String firstName,
      @HiveField(1) required String lastName,
      @HiveField(2) required DateTime lastEditDate}) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
