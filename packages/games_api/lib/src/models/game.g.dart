// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
  name: json['name'] as String,
  steamId: json['steamId'] as String,
  coverImage: json['coverImage'] as String,
  regularPrice: json['regularPrice'] as String,
  currentPrice: json['currentPrice'] as String,
  source: $enumDecode(_$GameSourceEnumMap, json['source']),
  discountPercent: (json['discountPercent'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
  'name': instance.name,
  'steamId': instance.steamId,
  'coverImage': instance.coverImage,
  'regularPrice': instance.regularPrice,
  'currentPrice': instance.currentPrice,
  'discountPercent': instance.discountPercent,
  'source': _$GameSourceEnumMap[instance.source]!,
};

const _$GameSourceEnumMap = {
  GameSource.nintendo: 'nintendo',
  GameSource.steam: 'steam',
  GameSource.none: 'none',
};
