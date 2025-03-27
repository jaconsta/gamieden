// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nintendo_game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NintendoGame _$NintendoGameFromJson(Map<String, dynamic> json) => NintendoGame(
  name: json['name'] as String,
  nintendoId: json['nintendoId'] as String,
  gameShopUrl: json['gameShopUrl'] as String,
  bannerImage: json['bannerImage'] as String,
  coverImage: json['coverImage'] as String,
  fullPrice: json['fullPrice'] as String,
  currentPrice: json['currentPrice'] as String,
  discountPercent: (json['discountPercent'] as num).toInt(),
);

Map<String, dynamic> _$NintendoGameToJson(NintendoGame instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nintendoId': instance.nintendoId,
      'gameShopUrl': instance.gameShopUrl,
      'coverImage': instance.coverImage,
      'bannerImage': instance.bannerImage,
      'fullPrice': instance.fullPrice,
      'currentPrice': instance.currentPrice,
      'discountPercent': instance.discountPercent,
    };
