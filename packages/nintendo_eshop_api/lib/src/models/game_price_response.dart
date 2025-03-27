import 'package:json_annotation/json_annotation.dart';
import 'package:nintendo_eshop_api/nintendo_eshop_api.dart';

part 'game_price_response.g.dart';

@JsonSerializable()
class GamePriceResponse {
  final bool personalized;
  final String country;
  final List<GamePricePrice> prices;

  GamePriceResponse({
    required this.personalized,
    required this.country,
    required this.prices,
  });

  factory GamePriceResponse.fromJson(Map<String, dynamic> json) =>
      _$GamePriceResponseFromJson(json);
}

