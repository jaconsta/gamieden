import 'package:json_annotation/json_annotation.dart';

part "game_search_details.g.dart";

@JsonSerializable()
class GameSearchDetails {
  @JsonKey(includeFromJson: false)
  late final String id;

  @JsonKey(name: "nsuid_txt", disallowNullValue: true)
  /// Internal ids of the available games
  final List<String> nsuIds;

  /// Page id
  final String fsId;

  @JsonKey(name: "title")
  final String name;
  @JsonKey(name: "url")
  /// The game page url.
  final String gamePath;

  @JsonKey(name: "pg_s")
  /// Expected to be GAME
  final String type;

  @JsonKey(name: "price_regular_f")
  final double? priceRegular;
  @JsonKey(name: "price_has_discount_b")
  final bool? priceHasDiscount;
  @JsonKey(name: "price_discounted_f")
  final double? priceDiscount;
  @JsonKey(name: "price_discount_percentage_f")
  final double discountPercent;
  @JsonKey(name: "paid_subscription_required_b")
  final bool requiresSubscription;

  @JsonKey(name: "wishlist_email_square_image_url_s")
  final String imageCapsule;
  @JsonKey(name: "wishlist_email_banner640w_image_url_s")
  final String imageBanner;

  GameSearchDetails({
    this.nsuIds = const [],
    required this.fsId,
    required this.name,
    required this.gamePath,
    required this.type,
    required this.priceRegular,
    required this.priceHasDiscount,
    required this.priceDiscount,
    required this.discountPercent,
    required this.requiresSubscription,
    required this.imageCapsule,
    required this.imageBanner,
  });

  factory GameSearchDetails.fromJson(Map<String, dynamic> json) =>
      _$GameSearchDetailsFromJson(json);

  GameSearchDetails copyWith({
    List<String>? nsuIds,
    String? fsId,
    String? name,
    String? gamePath,
    String? type,
    double? priceRegular,
    bool? priceHasDiscount,
    double? priceDiscount,
    double? discountPercent,
    bool? requiresSubscription,
    String? imageCapsule,
    String? imageBanner,
  }) => GameSearchDetails(
    nsuIds: nsuIds ?? this.nsuIds,
    fsId: fsId ?? this.fsId,
    name: name ?? this.name,
    gamePath: gamePath ?? this.gamePath,
    type: type ?? this.type,
    priceRegular: priceRegular ?? this.priceRegular,
    priceHasDiscount: priceHasDiscount ?? this.priceHasDiscount,
    priceDiscount: priceDiscount ?? this.priceDiscount,
    discountPercent: discountPercent ?? this.discountPercent,
    requiresSubscription: requiresSubscription ?? this.requiresSubscription,
    imageCapsule: imageCapsule ?? this.imageCapsule,
    imageBanner: imageBanner ?? this.imageBanner,
  );
}
