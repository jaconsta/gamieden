import 'dart:convert';

import 'package:games_api/games_api.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageGameApi extends GamesApi {
  final GameFactory _gameFactory;
  final SharedPreferences _plugin;
  late final _gamesStreamController = BehaviorSubject<List<GameApi>>.seeded(
    const [],
  );

  static const kGamesCollectionKey = "__games_collection_key__";

  LocalStorageGameApi({
    required SharedPreferences plugin,
    required GameFactory gameFactory,
  }) : _plugin = plugin,
       _gameFactory = gameFactory {
    _init();
  }

  void _init() {
    final gamesJson = _getValue(kGamesCollectionKey);
    if (gamesJson != null) {
      final games =
          List<Map<String, dynamic>>.from(
            json.decode(gamesJson) as List,
          ).map((jsonMap) => _gameFactory.fromJson(jsonMap)).toList();

      _gamesStreamController.add(games);
    } else {
      _gamesStreamController.add(const []);
    }
  }

  @override
  Stream<List<GameApi>> getGames() =>
      _gamesStreamController.asBroadcastStream();

  @override
  Future<void> saveGame(GameApi game) {
    final games = [..._gamesStreamController.value];
    final gameIndex = games.indexWhere((g) => g.sourceId == game.sourceId);
    if (gameIndex == -1) {
      games.add(game);
    } else {
      games[gameIndex] = game;
    }

    _gamesStreamController.add(games);
    return _setValue(kGamesCollectionKey, json.encode(games));
  }

  @override
  Future<void> deleteGame(GameApi game) {
    final games = [..._gamesStreamController.value];
    final gameIndex = games.indexWhere((g) => g.sourceId == game.sourceId);
    if (gameIndex == -1) {
      throw GamesApiNotFound();
    } else {
      games.removeAt(gameIndex);
      _gamesStreamController.add(games);
      return _setValue(kGamesCollectionKey, json.encode(games));
    }
  }

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  @override
  Future<void> close() {
    return _gamesStreamController.close();
  }
}
