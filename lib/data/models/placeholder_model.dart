import 'package:equatable/equatable.dart';

// models are the direct mapping from repository/apis
// entities are the logical models

class PlaceholderModel extends Equatable {
  final int placeholderId;
  final String placeholderName;
  final String? optionalPlaceholder;

  const PlaceholderModel(
      {required this.placeholderId,
      required this.placeholderName,
      required this.optionalPlaceholder});

  factory PlaceholderModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['placeholder_jsontitle'];

    return PlaceholderModel(
        placeholderId: jsonUserData['placeholderId'],
        placeholderName: jsonUserData['placeholderName'],
        optionalPlaceholder: jsonUserData['optionalPlaceholder']);
  }

  Map<String, dynamic> toJson() {
    return {
      'placeholderId': placeholderId,
      'placeholderName': placeholderName,
      'optionalPlaceholder': optionalPlaceholder
    };
  }

  @override
  List<Object?> get props =>
      [placeholderId, placeholderName, optionalPlaceholder];
}
