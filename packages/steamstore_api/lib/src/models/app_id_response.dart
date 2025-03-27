import 'package:json_annotation/json_annotation.dart';

import 'app_details.dart';

part 'app_id_response.g.dart';

class AppDetailsNotFoundException implements Exception {}

@JsonSerializable()
class AppIdResponse {
  final bool success;
  final AppDetails? data;

  AppIdResponse({required this.success, required this.data});

  factory AppIdResponse.fromJson(Map<String, dynamic> json) =>
      _$AppIdResponseFromJson(json);

  AppDetails get appDetails {
    // `data` shouldn't be null if the id was found.
    if (!success || data == null) throw AppDetailsNotFoundException();
    return data!;
  }
}
