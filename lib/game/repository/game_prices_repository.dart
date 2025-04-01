import 'package:games_repository/games_repository.dart' as games_repository;
import 'package:games_api/games_api.dart';
import 'package:nintendo_eshop_repository/nintendo_eshop_repository.dart';
import 'package:steamstore_repository/steamstore_repository.dart'
    show SteamstoreRepository;

class GamePricesRepository {
  final games_repository.GamesRepository gamesRepository;
  final NintendoEshopRepository nintendoEshopRepository;
  final SteamstoreRepository steamStoreRepository;

  GamePricesRepository({
    required this.gamesRepository,
    required this.nintendoEshopRepository,
    required this.steamStoreRepository,
  });

  Future<void> updatePrices(List<GameApi> games) async {
    final List<String> steamGames = [];
    final List<String> nintendoGames = [];

    for (final game in games) {
      switch (game.source) {
        case GameSource.steam:
          steamGames.add(game.sourceId);
        case GameSource.nintendo:
          nintendoGames.add(game.sourceId);
        default:
          {}
      }
    }

    final steamPrices = await steamStoreRepository.getPrices(steamGames);
    final Map<String, GamePrice> steamGamePrices = {};
    for (final steamKey in steamPrices.keys) {
      final price = steamPrices[steamKey]!;
      final gamePrice = GamePrice(
        currentPrice: price.currentPrice,
        fullPrice: price.fullPrice,
        discountPercent: "${price.discountPercent}",
      );
      steamGamePrices[steamKey] = gamePrice;
    }
    final nintendoPrices = await nintendoEshopRepository.prices(steamGames);
    final Map<String, GamePrice> nintendoGamePrices = {};
    for (final nintendoKey in nintendoPrices.keys) {
      final price = nintendoPrices[nintendoKey]!;
      final gamePrice = GamePrice(
        currentPrice: price.currentPrice,
        fullPrice: price.fullPrice,
        discountPercent: "${price.discountPercent}",
      );
      nintendoGamePrices[nintendoKey] = gamePrice;
    }

    final updatedPrices = games.map(
      (game) => switch (game.source) {
        GameSource.steam =>
          steamPrices.containsKey(game.sourceId)
              ? game.setPrice(steamGamePrices[game.sourceId]!)
              : game,
        GameSource.nintendo =>
          nintendoPrices.containsKey(game.sourceId)
              ? game.setPrice(nintendoGamePrices[game.sourceId]!)
              : game,
        _ => game,
      },
    );

    for (final gamex in updatedPrices) {
      gamesRepository.saveGame(gamex);
    }
  }
}
