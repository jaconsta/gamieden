import 'package:equatable/equatable.dart';
import 'package:games_api/games_api.dart';
import 'package:json_annotation/json_annotation.dart';

part "nintendo_game.g.dart";

@JsonSerializable()
class NintendoGame extends Equatable implements GameApi {
  final String name;
  final String nintendoId;
  final String gameShopUrl;
  final String coverImage;
  final String bannerImage;
  final String fullPrice;
  final String currentPrice;
  final int discountPercent;

  const NintendoGame({
    required this.name,
    required this.nintendoId,
    required this.gameShopUrl,
    required this.bannerImage,
    required this.coverImage,
    required this.fullPrice,
    required this.currentPrice,
    required this.discountPercent,
  });

  @override
  factory NintendoGame.fromJson(JsonMap json) => _$NintendoGameFromJson(json);

  @override
  JsonMap toJson() => _$NintendoGameToJson(this);

  @override
  List<Object?> get props => [
    name,
    nintendoId,
    coverImage,
    bannerImage,
    fullPrice,
    currentPrice,
    discountPercent,
  ];

  NintendoGame copyWith({
    String? name,
    String? nintendoId,
    String? gameShopUrl,
    String? coverImage,
    String? bannerImage,
    String? fullPrice,
    String? currentPrice,
    int? discountPercent,
  }) => NintendoGame(
    name: name ?? this.name,
    nintendoId: nintendoId ?? this.nintendoId,
    gameShopUrl: gameShopUrl ?? this.gameShopUrl,
    bannerImage: bannerImage ?? this.bannerImage,
    coverImage: coverImage ?? this.coverImage,
    fullPrice: fullPrice ?? this.fullPrice,
    currentPrice: currentPrice ?? this.currentPrice,
    discountPercent: discountPercent ?? this.discountPercent,
  );

  static NintendoGame empty() => NintendoGame(
    name: "",
    nintendoId: "",
    gameShopUrl: "",
    bannerImage: "",
    coverImage: "",
    fullPrice: "",
    currentPrice: "",
    discountPercent: 0,
  );

  @override
  GamePrice get price => GamePrice(
    currentPrice: currentPrice,
    fullPrice: fullPrice,
    discountPercent: "$discountPercent",
  );

  @override
  GameSource get source => GameSource.nintendo;

  @override
  String get sourceId => nintendoId;

  @override
  GameSummary get summary => GameSummary(name: name, coverUrl: bannerImage);

  @override
  NintendoGame setPrice(GamePrice price) {
    return copyWith(
      currentPrice: price.currentPrice,
      fullPrice: fullPrice,
      discountPercent: discountPercent,
    );
  }
}
