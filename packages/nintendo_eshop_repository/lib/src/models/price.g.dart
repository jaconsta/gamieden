// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
  gameId: json['gameId'] as String,
  fullPrice: json['fullPrice'] as String,
  currentPrice: json['currentPrice'] as String,
  discountPercent: (json['discountPercent'] as num).toInt(),
);

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
  'gameId': instance.gameId,
  'fullPrice': instance.fullPrice,
  'currentPrice': instance.currentPrice,
  'discountPercent': instance.discountPercent,
};
