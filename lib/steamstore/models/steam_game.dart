import 'package:equatable/equatable.dart';
import 'package:games_api/games_api.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:steamstore_repository/steamstore_repository.dart'
    as steamstore_repository;

part "steam_game.g.dart";

@JsonSerializable()
class SteamGame extends Equatable implements GameApi {
  /// Game name.
  final String name;

  /// Game Id according from Steam.
  final String steamId;

  /// Image url that shows the game "logo".
  final String coverImage;

  /// Original price When a discount is applied.
  final String fullPrice;

  /// Price with Discount or full price when there is no discount.
  final String? currentPrice;

  /// How much is the discount according to the platform.
  final int discountPercent;

  const SteamGame({
    required this.name,
    required this.steamId,
    required this.coverImage,
    required this.fullPrice,
    this.currentPrice,
    this.discountPercent = 0,
  });

  factory SteamGame.fromJson(Map<String, dynamic> json) =>
      _$SteamGameFromJson(json);

  factory SteamGame.fromSteamGame(steamstore_repository.SteamGame steamGame) {
    return SteamGame(
      name: steamGame.name,
      steamId: steamGame.steamId,
      coverImage: steamGame.coverImage,
      fullPrice: steamGame.fullPrice,
      currentPrice: steamGame.currentPrice,
      discountPercent: steamGame.discountPercent,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$SteamGameToJson(this);

  static SteamGame empty() => SteamGame(
    name: "",
    steamId: "",
    coverImage: "",
    fullPrice: "",
    currentPrice: "",
    discountPercent: 0,
  );

  SteamGame copyWith({
    String? name,
    String? steamId,
    String? coverImage,
    String? fullPrice,
    String? currentPrice,
    int? discountPercent,
  }) {
    return SteamGame(
      name: name ?? this.name,
      steamId: steamId ?? this.steamId,
      coverImage: coverImage ?? this.coverImage,
      fullPrice: fullPrice ?? this.fullPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      discountPercent: discountPercent ?? this.discountPercent,
    );
  }

  @override
  List<Object?> get props => [
    name,
    steamId,
    coverImage,
    fullPrice,
    currentPrice,
    discountPercent,
  ];

  @override
  GamePrice get price => GamePrice(
    fullPrice: fullPrice,
    currentPrice: currentPrice ?? "",
    discountPercent: "$discountPercent",
  );

  @override
  GameSource get source => GameSource.steam;

  @override
  String get sourceId => steamId;

  @override
  GameSummary get summary => GameSummary(name: name, coverUrl: coverImage);
}
