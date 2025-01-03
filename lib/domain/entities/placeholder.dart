import 'package:equatable/equatable.dart';

// entity is the logical model

class Placeholder extends Equatable {
  final int placeholderId;
  final String placeholderName;
  final String? optionalPlaceholder;

  const Placeholder(
      {required this.placeholderId,
      required this.placeholderName,
      required this.optionalPlaceholder});

  factory Placeholder.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> jsonUserData = jsonData['placeholder_jsontitle'];

    return Placeholder(
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
