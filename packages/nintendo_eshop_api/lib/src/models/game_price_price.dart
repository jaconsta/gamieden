import 'package:json_annotation/json_annotation.dart';

part "game_price_price.g.dart";

@JsonSerializable()
class GamePricePrice {
  /// Same as nsuId
  final int titleId;

  /// on_sale, unreleased
  final String salesStatus;
  final RegularPrice? regularPrice;
  final DiscountPrice? discountPrice;
  final GoldPoint? goldPoint;

  GamePricePrice({
    required this.titleId,
    required this.salesStatus,
    required this.regularPrice,
    required this.discountPrice,
    required this.goldPoint,
  });

  factory GamePricePrice.fromJson(Map<String, dynamic> json) =>
      _$GamePricePriceFromJson(json);
}

@JsonSerializable()
class RegularPrice {
  final String amount;
  final String currency;
  final String rawValue;

  RegularPrice({
    required this.amount,
    required this.currency,
    required this.rawValue,
  });

  factory RegularPrice.fromJson(Map<String, dynamic> json) =>
      _$RegularPriceFromJson(json);
}

@JsonSerializable()
class DiscountPrice {
  final String amount;
  final String currency;
  final String rawValue;
  final String startDatetime;
  final String endDatetime;

  DiscountPrice({
    required this.amount,
    required this.currency,
    required this.rawValue,
    required this.startDatetime,
    required this.endDatetime,
  });

  factory DiscountPrice.fromJson(Map<String, dynamic> json) =>
      _$DiscountPriceFromJson(json);
}

@JsonSerializable()
class GoldPoint {
  final String basicGiftGp;
  final String basicGiftRate;
  final String consumeGp;
  final List<String> extraGoldPoints;
  final String giftGp;
  final String giftRate;

  GoldPoint({
    required this.basicGiftGp,
    required this.basicGiftRate,
    required this.consumeGp,
    required this.extraGoldPoints,
    required this.giftGp,
    required this.giftRate,
  });

  factory GoldPoint.fromJson(Map<String, dynamic> json) =>
      _$GoldPointFromJson(json);
}
