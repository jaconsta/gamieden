// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'game_price_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePricePrice _$GamePricePriceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'GamePricePrice',
  json,
  ($checkedConvert) {
    final val = GamePricePrice(
      titleId: $checkedConvert('title_id', (v) => (v as num).toInt()),
      salesStatus: $checkedConvert('sales_status', (v) => v as String),
      regularPrice: $checkedConvert(
        'regular_price',
        (v) =>
            v == null ? null : RegularPrice.fromJson(v as Map<String, dynamic>),
      ),
      discountPrice: $checkedConvert(
        'discount_price',
        (v) =>
            v == null
                ? null
                : DiscountPrice.fromJson(v as Map<String, dynamic>),
      ),
      goldPoint: $checkedConvert(
        'gold_point',
        (v) => v == null ? null : GoldPoint.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'titleId': 'title_id',
    'salesStatus': 'sales_status',
    'regularPrice': 'regular_price',
    'discountPrice': 'discount_price',
    'goldPoint': 'gold_point',
  },
);

RegularPrice _$RegularPriceFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RegularPrice', json, ($checkedConvert) {
      final val = RegularPrice(
        amount: $checkedConvert('amount', (v) => v as String),
        currency: $checkedConvert('currency', (v) => v as String),
        rawValue: $checkedConvert('raw_value', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'rawValue': 'raw_value'});

DiscountPrice _$DiscountPriceFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DiscountPrice',
      json,
      ($checkedConvert) {
        final val = DiscountPrice(
          amount: $checkedConvert('amount', (v) => v as String),
          currency: $checkedConvert('currency', (v) => v as String),
          rawValue: $checkedConvert('raw_value', (v) => v as String),
          startDatetime: $checkedConvert('start_datetime', (v) => v as String),
          endDatetime: $checkedConvert('end_datetime', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'rawValue': 'raw_value',
        'startDatetime': 'start_datetime',
        'endDatetime': 'end_datetime',
      },
    );

GoldPoint _$GoldPointFromJson(Map<String, dynamic> json) => $checkedCreate(
  'GoldPoint',
  json,
  ($checkedConvert) {
    final val = GoldPoint(
      basicGiftGp: $checkedConvert('basic_gift_gp', (v) => v as String),
      basicGiftRate: $checkedConvert('basic_gift_rate', (v) => v as String),
      consumeGp: $checkedConvert('consume_gp', (v) => v as String),
      extraGoldPoints: $checkedConvert(
        'extra_gold_points',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      giftGp: $checkedConvert('gift_gp', (v) => v as String),
      giftRate: $checkedConvert('gift_rate', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'basicGiftGp': 'basic_gift_gp',
    'basicGiftRate': 'basic_gift_rate',
    'consumeGp': 'consume_gp',
    'extraGoldPoints': 'extra_gold_points',
    'giftGp': 'gift_gp',
    'giftRate': 'gift_rate',
  },
);
