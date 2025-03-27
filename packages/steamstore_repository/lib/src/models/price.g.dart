// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Price',
  json,
  ($checkedConvert) {
    final val = Price(
      gameId: $checkedConvert('game_id', (v) => v as String),
      fullPrice: $checkedConvert('full_price', (v) => v as String),
      currentPrice: $checkedConvert('current_price', (v) => v as String),
      discountPercent: $checkedConvert(
        'discount_percent',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'gameId': 'game_id',
    'fullPrice': 'full_price',
    'currentPrice': 'current_price',
    'discountPercent': 'discount_percent',
  },
);

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
  'game_id': instance.gameId,
  'full_price': instance.fullPrice,
  'current_price': instance.currentPrice,
  'discount_percent': instance.discountPercent,
};
