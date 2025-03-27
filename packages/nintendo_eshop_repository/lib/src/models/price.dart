import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "price.g.dart";

@JsonSerializable()
/// Clone from steamstore_repository/lib/src/models/price.dart
class Price extends Equatable {
  final String gameId;
  final String fullPrice;
  final String currentPrice;
  final int discountPercent;

  const Price({
    required this.gameId,
    required this.fullPrice,
    required this.currentPrice,
    required this.discountPercent,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);

  @override
  List<Object?> get props => [gameId, fullPrice, currentPrice, discountPercent];
}
