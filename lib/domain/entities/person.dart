import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
class Person with _$Person {
  Person._();

  @HiveType(typeId: 1)
  factory Person({
    required int id,
    required String firstName,
    required String lastName,
    required DateTime lastEditDate,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);
}
