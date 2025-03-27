import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart' show Color;
import 'package:json_annotation/json_annotation.dart';

part "game.g.dart";

/// The supported APIs.
enum GameSource { nintendo, steam, none }

extension GameSourceString on GameSource {
  String get name {
    return switch (this) {
      GameSource.nintendo => "nintendo",
      GameSource.steam => "steam",
      GameSource.none => "none",
    };
  }

  Color get color {
    return switch (this) {
      GameSource.nintendo => Colors.red,
      GameSource.steam => Colors.blue,
      GameSource.none => Colors.green,
    };
  }

  String get urlDomain {
    return switch (this) {
      GameSource.nintendo => "nintendo",
      GameSource.steam => "steamstore",
      GameSource.none => "none",
    };
  }
}

/// {@template game_item}
/// A single Game Item.
///
/// Contains a [name], [coverImage] url, and price information with its discount.
/// {@endtemplate}
@JsonSerializable()
class Game extends Equatable {
  /// Game name.
  final String name;

  /// Game Id according from Steam.
  final String steamId;

  /// Image url that shows the game "logo".
  final String coverImage;

  /// The price without discount.
  final String regularPrice;

  /// Price with Discount or full price when there is no discount.
  final String currentPrice;

  /// How much is the discount according to the platform.
  final int discountPercent;

  /// Api source of the game
  final GameSource source;

  /// {@macro game_item}
  const Game({
    required this.name,
    required this.steamId,
    required this.coverImage,
    required this.regularPrice,
    required this.currentPrice,
    required this.source,
    this.discountPercent = 0,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);

  static Game empty() => Game(
    name: "",
    steamId: "",
    coverImage: "",
    regularPrice: "",
    currentPrice: "",
    source: GameSource.none,
    discountPercent: 0,
  );

  Game copyWith({
    String? name,
    String? steamId,
    String? coverImage,
    String? regularPrice,
    String? currentPrice,
    int? discountPercent,
    GameSource? source,
  }) {
    return Game(
      name: name ?? this.name,
      steamId: steamId ?? this.steamId,
      coverImage: coverImage ?? this.coverImage,
      regularPrice: regularPrice ?? this.regularPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [
    name,
    steamId,
    coverImage,
    regularPrice,
    currentPrice,
    discountPercent,
    source,
  ];
}
