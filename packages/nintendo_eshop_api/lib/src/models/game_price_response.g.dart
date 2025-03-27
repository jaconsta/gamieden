// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'game_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePriceResponse _$GamePriceResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('GamePriceResponse', json, ($checkedConvert) {
      final val = GamePriceResponse(
        personalized: $checkedConvert('personalized', (v) => v as bool),
        country: $checkedConvert('country', (v) => v as String),
        prices: $checkedConvert(
          'prices',
          (v) =>
              (v as List<dynamic>)
                  .map(
                    (e) => GamePricePrice.fromJson(e as Map<String, dynamic>),
                  )
                  .toList(),
        ),
      );
      return val;
    });
