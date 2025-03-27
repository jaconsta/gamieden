import 'package:games_api/src/models/game.dart' show GameSource;
import 'package:games_api/src/models/json_map.dart';

/// {@template game_api}
/// Interface for an API that provides a list of Games.
/// {@endtemplate}
abstract class GamesApi {
  /// {@macro games_api}
  const GamesApi();

  /// Provides a Stream of all Games.
  Stream<List<GameApi>> getGames();

  /// Saves an element that fills [GamesApi]
  Future<void> saveGame(GameApi game);

  // Delete a game from the list.
  Future<void> deleteGame(GameApi game);

  // Closes the client and frees the resources.
  Future<void> close();
}

/// {@template game_api}
/// Interface what a games api must return.
/// It includes normal information and the price information.
/// {@endtemplate}
abstract class GameApi {
  // /// {@macro games_api}
  // const GameApi();

  // Unique identifier.
  String get sourceId;

  /// The game information.
  GameSummary get summary;

  /// The price information to show about it.
  GamePrice get price;

  /// The API to query from.
  GameSource get source;

  /// From JSON object to [GameApi].
  JsonMap toJson();
}

abstract class GameFactory {
  /// From [GameApi] to JSON.
  GameApi fromJson(JsonMap json);
}

/// {@template game_summary}
/// Attributes necessary to show the game description.
/// {@endtemplate}
class GameSummary {
  final String name;
  final String coverUrl;

  /// {@macro game_summary}
  GameSummary({required this.name, required this.coverUrl});
}

/// {@template game_price}
/// Attributes necessary to show the game price.
/// {@endtemplate}
class GamePrice {
  final String currentPrice;
  final String fullPrice;
  final String discountPercent;

  /// {@macro game_price}
  GamePrice({
    required this.currentPrice,
    required this.fullPrice,
    required this.discountPercent,
  });
}

class GamesApiNotFound implements Exception {}
