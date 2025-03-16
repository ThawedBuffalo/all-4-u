import 'package:json_annotation/json_annotation.dart';

class IdIntConv implements JsonConverter<int, int> {
  const IdIntConv();
  static const int defaultId = 0;

  @override
  int fromJson(int json) => json == null ? defaultId : 0;

  @override
  int toJson(int id) => id == null ? defaultId : 0;
}
