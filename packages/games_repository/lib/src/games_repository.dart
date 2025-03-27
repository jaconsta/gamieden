import 'package:games_api/games_api.dart';

class GamesRepository {
  final GamesApi _gamesApi;

  const GamesRepository({required GamesApi gamesApi}) : _gamesApi = gamesApi;

  /// Provides a stream of `games` via [GameApi]
  Stream<List<GameApi>> getGames() => _gamesApi.getGames();

  /// Add / update a `game`.
  Future<void> saveGame(GameApi game) => _gamesApi.saveGame(game);

  /// Remove a `game` from the list.
  /// Uses the game given id.
  Future<void> deleteGame(GameApi game) => _gamesApi.deleteGame(game);

  /// Dispose any resources managed by the repository.
  /// Close the stream.
  void dispose() => _gamesApi.close();
}
