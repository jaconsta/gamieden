// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteamGame _$SteamGameFromJson(Map<String, dynamic> json) => $checkedCreate(
  'SteamGame',
  json,
  ($checkedConvert) {
    final val = SteamGame(
      name: $checkedConvert('name', (v) => v as String),
      steamId: $checkedConvert('steam_id', (v) => v as String),
      fullPrice: $checkedConvert('full_price', (v) => v as String),
      currentPrice: $checkedConvert('current_price', (v) => v as String),
      discountPercent: $checkedConvert(
        'discount_percent',
        (v) => (v as num).toInt(),
      ),
      coverImage: $checkedConvert('cover_image', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'steamId': 'steam_id',
    'fullPrice': 'full_price',
    'currentPrice': 'current_price',
    'discountPercent': 'discount_percent',
    'coverImage': 'cover_image',
  },
);

Map<String, dynamic> _$SteamGameToJson(SteamGame instance) => <String, dynamic>{
  'name': instance.name,
  'steam_id': instance.steamId,
  'cover_image': instance.coverImage,
  'full_price': instance.fullPrice,
  'current_price': instance.currentPrice,
  'discount_percent': instance.discountPercent,
};
