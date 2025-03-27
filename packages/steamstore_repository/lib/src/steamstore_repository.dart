import 'package:steamstore_api/steamstore_api.dart';
import 'package:steamstore_repository/steamstore_repository.dart';

class SteamstoreRepository {
  final SteamStoreApiClient _storeApiClient;

  SteamstoreRepository({SteamStoreApiClient? storeApiClient})
    : _storeApiClient = storeApiClient ?? SteamStoreApiClient();

  Future<SteamGame> getOne(String gameId) async {
    final appDetails = await _storeApiClient.appDetailsSearch(gameId);
    final steamGameId =
        appDetails.steamAppId == null
            ? appDetails.id
            : "${appDetails.steamAppId}";

    return SteamGame(
      name: appDetails.name ?? "No name",
      steamId: steamGameId,
      coverImage: appDetails.capsuleImage ?? "",
      fullPrice: appDetails.priceOverview.initialPriceFormatted,
      currentPrice: appDetails.priceOverview.finalPriceFormatted,
      discountPercent: appDetails.priceOverview.discountPercent,
    );
  }

  Future<Map<String, Price>> getPrices(List<String> gameIds) async {
    final appDetails = await _storeApiClient.appDetailsPricesSearch(gameIds);
    Map<String, Price> gamePrices = {};

    for (var game in appDetails.values) {
      gamePrices[game.id] = Price(
        gameId: game.id,
        currentPrice: game.priceOverview.finalPriceFormatted,
        fullPrice: game.priceOverview.initialPriceFormatted,
        discountPercent: game.priceOverview.discountPercent,
      );
    }

    return gamePrices;
  }
}
