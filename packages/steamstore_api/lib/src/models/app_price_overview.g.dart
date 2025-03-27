// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'app_price_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceOverview _$PriceOverviewFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PriceOverview',
      json,
      ($checkedConvert) {
        final val = PriceOverview(
          currency: $checkedConvert('currency', (v) => v as String),
          initialPrice: $checkedConvert('initial', (v) => (v as num).toInt()),
          finalPrice: $checkedConvert('final', (v) => (v as num).toInt()),
          discountPercent: $checkedConvert(
            'discount_percent',
            (v) => (v as num).toInt(),
          ),
          initialPriceFormatted: $checkedConvert(
            'initial_formatted',
            (v) => v as String,
          ),
          finalPriceFormatted: $checkedConvert(
            'final_formatted',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'initialPrice': 'initial',
        'finalPrice': 'final',
        'discountPercent': 'discount_percent',
        'initialPriceFormatted': 'initial_formatted',
        'finalPriceFormatted': 'final_formatted',
      },
    );
