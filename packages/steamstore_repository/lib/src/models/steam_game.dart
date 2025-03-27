import 'package:equatable/equatable.dart';
import 'package:games_api/games_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'steam_game.g.dart';

@JsonSerializable()
class SteamGame extends Equatable implements GameApi {
  final String name;
  final String steamId;
  final String coverImage;
  final String fullPrice;
  final String currentPrice;
  final int discountPercent;

  const SteamGame({
    required this.name,
    required this.steamId,
    required this.fullPrice,
    required this.currentPrice,
    required this.discountPercent,
    required this.coverImage,
  });

  factory SteamGame.fromJson(Map<String, dynamic> json) =>
      _$SteamGameFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SteamGameToJson(this);

  @override
  List<Object?> get props => [
    name,
    steamId,
    fullPrice,
    currentPrice,
    discountPercent,
    coverImage,
  ];

  @override
  GamePrice get price => GamePrice(
    currentPrice: currentPrice,
    fullPrice: fullPrice,
    discountPercent: "$discountPercent",
  );

  @override
  GameSource get source => GameSource.steam;

  @override
  String get sourceId => steamId;

  @override
  GameSummary get summary => GameSummary(name: name, coverUrl: coverImage);
}
