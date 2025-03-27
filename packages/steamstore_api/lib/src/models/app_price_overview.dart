import 'package:json_annotation/json_annotation.dart';

part 'app_price_overview.g.dart';

@JsonSerializable()
class PriceOverview {
  final String currency;
  @JsonKey(name: "initial")
  final int initialPrice;
  @JsonKey(name: "final")
  final int finalPrice;
  final int discountPercent;
  @JsonKey(name: "initial_formatted")
  final String initialPriceFormatted;
  @JsonKey(name: "final_formatted")
  final String finalPriceFormatted;

  const PriceOverview({
    required this.currency,
    required this.initialPrice,
    required this.finalPrice,
    required this.discountPercent,
    required this.initialPriceFormatted,
    required this.finalPriceFormatted,
  });

  factory PriceOverview.fromJson(Map<String, dynamic> json) =>
      _$PriceOverviewFromJson(json);
}
