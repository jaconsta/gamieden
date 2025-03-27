import 'package:json_annotation/json_annotation.dart';

import 'app_price_overview.dart';

part 'app_details.g.dart';

@JsonSerializable()
class AppDetails {
  /// [id] and [steamAppId] should match if `[steamAppId] != null`
  @JsonKey(includeFromJson: false)
  late final String id;
  @JsonKey(name: "steam_appid")
  final int? steamAppId;

  final PriceOverview priceOverview;

  final String? type;
  final String? name;

  @JsonKey(name: "capsule_imagev5")
  final String? capsuleImage;

  AppDetails({
    required this.priceOverview,
    this.steamAppId,
    this.type,
    this.name,
    this.capsuleImage,
  });

  factory AppDetails.fromJson(Map<String, dynamic> json) =>
      _$AppDetailsFromJson(json);
}
