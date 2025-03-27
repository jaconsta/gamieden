import "package:intl/intl.dart" show NumberFormat;
import "package:nintendo_eshop_api/nintendo_eshop_api.dart";
import "package:nintendo_eshop_repository/src/models/models.dart";

class NintendoEshopRepository {
  final NintendoEshopApiClient _eshopApiClient;

  NintendoEshopRepository({NintendoEshopApiClient? eshopApiClient})
    : _eshopApiClient = eshopApiClient ?? NintendoEshopApiClient();

  Future<List<NintendoGame>> find(String gameName) async {
    final gameList = await searchGames(gameName);

    final nsuIds = gameList.map((gl) => gl.nintendoId).toList();
    final gamePrices = await prices(nsuIds);

    List<NintendoGame> games = [];
    for (var game in gameList) {
      final gamePrice = gamePrices[game.nintendoId];
      if (gamePrice != null) {
        games.add(
          game.copyWith(
            discountPercent: gamePrice.discountPercent,
            fullPrice: gamePrice.fullPrice,
            currentPrice: gamePrice.currentPrice,
          ),
        );
      } else {
        games.add(game);
      }
    }

    return games;
  }

  Future<List<NintendoGame>> searchGames(String gameName) async {
    final gameDetails = await _eshopApiClient.gameSearch(gameName, size: 30);

    // One can get many gameDetails possibilities.
    // Example normal, GOY, GamePass
    // The correct way should be, by web scrapping the gamePage,
    // But since it is not there, it is the task of the user to choose the correct version based on the price.
    final List<GameSearchDetails> gameDetailsFlatten = [];
    for (var gd in gameDetails) {
      for (var nsuId in gd.nsuIds) {
        gameDetailsFlatten.add(gd.copyWith(nsuIds: [nsuId]));
      }
    }

    final nintendoGames =
        gameDetailsFlatten
            .map(
              (g) => NintendoGame(
                name: g.name,
                nintendoId: g.nsuIds.first,
                gameShopUrl: g.gamePath,
                coverImage: g.imageCapsule,
                bannerImage: g.imageBanner,
                fullPrice: "${g.priceRegular ?? 0} €",
                currentPrice: "${g.priceDiscount ?? g.priceRegular ?? 0}",
                discountPercent: g.discountPercent.toInt(),
              ),
            )
            .toList();
    return nintendoGames;
  }

  Future<Map<String, Price>> prices(List<String> gamesIds) async {
    final eshopPrices = await _eshopApiClient.getPrices(gamesIds);
    final Map<String, Price> prices = {};

    for (final eshopPrice in eshopPrices.values) {
      if (eshopPrice.salesStatus != "onsale") {
        Price gamePrice = Price(
          gameId: "${eshopPrice.titleId}",
          currentPrice: "",
          fullPrice: "",
          discountPercent: 0,
        );
        prices["${eshopPrice.titleId}"] = gamePrice;
        continue;
      }

      final currencySymbol = NumberFormat().simpleCurrencySymbol(
        eshopPrice.regularPrice?.currency ?? '',
      );
      final currentPrice =
          "${eshopPrice.discountPrice?.rawValue ?? eshopPrice.regularPrice?.rawValue ?? ""} $currencySymbol";
      final fullPrice =
          "${eshopPrice.regularPrice?.amount ?? ""} $currencySymbol";

      int discountPercent = 0;
      if (eshopPrice.regularPrice != null && eshopPrice.discountPrice != null) {
        final regularPrice =
            (double.tryParse(eshopPrice.regularPrice?.rawValue ?? "0") ?? 0.0);
        var discount =
            (regularPrice -
                (double.tryParse(eshopPrice.discountPrice?.rawValue ?? "0") ??
                    0.0)) *
            100 /
            regularPrice;
        discountPercent = discount.toInt();
      }

      Price gamePrice = Price(
        gameId: "${eshopPrice.titleId}",
        currentPrice: currentPrice,
        fullPrice: fullPrice,
        discountPercent: discountPercent,
      );
      prices["${eshopPrice.titleId}"] = gamePrice;
    }

    return prices;
  }
}
