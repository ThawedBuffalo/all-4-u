import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'person.freezed.dart';
part 'person.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Person with _$Person {
  const factory Person(
      {required String firstName,
      required String lastName,
      required DateTime lastEditDate}) = _Person;

  Id id = Isar.autoIncrement;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
