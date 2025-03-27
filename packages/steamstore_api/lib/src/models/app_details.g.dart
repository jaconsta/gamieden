// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'app_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDetails _$AppDetailsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'AppDetails',
  json,
  ($checkedConvert) {
    final val = AppDetails(
      priceOverview: $checkedConvert(
        'price_overview',
        (v) => PriceOverview.fromJson(v as Map<String, dynamic>),
      ),
      steamAppId: $checkedConvert('steam_appid', (v) => (v as num?)?.toInt()),
      type: $checkedConvert('type', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      capsuleImage: $checkedConvert('capsule_imagev5', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'priceOverview': 'price_overview',
    'steamAppId': 'steam_appid',
    'capsuleImage': 'capsule_imagev5',
  },
);
