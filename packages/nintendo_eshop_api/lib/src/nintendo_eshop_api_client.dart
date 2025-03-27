import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nintendo_eshop_api/src/models/models.dart';

/// Exception thrown when the query fails.
class GamesSearchRequestFailure implements Exception {}

/// Exception thrown when the response parsing fails.
class GamesSearchParsingFailure implements Exception {}

/// Exception thrown when the response has no content.
class GamesSearchEmptyResponseFailure implements Exception {}

/// Exception thrown when the provided appId is not found.
class GamesSearchNotFoundFailure implements Exception {}

/// Exception thrown when the price for the provided appId is not found.
class GamesPriceNotFoundFailure implements Exception {}

/// {@template nintendo_eshop_api_client}
/// Dart API client to wrap the games search from [nintendo eshop](www.nintendo.com)
/// {@endtemplate}
class NintendoEshopApiClient {
  final http.Client _httpClient;

  static const _baseUrlNintendoEshop = "searching.nintendo-europe.com";
  static const _basePriceUrlNintendoEshop = "api.ec.nintendo.com";

  NintendoEshopApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  /// Queries a list of games matching the game name criteria
  /// Uses [appFsId], corresponds to the pageId, to filter out exact game match. (not used atm)
  Future<List<GameSearchDetails>> gameSearch(
    String gameName, {
    String? appFsId,
    int page = 0,
    int size = 10,
  }) async {
    final wrf = "json";

    final appDetailsRequest = Uri.https(_baseUrlNintendoEshop, "/de/select", {
      "q": gameName,
      // "q": '*',
      // "fq": 'type:GAME AND system_type:nintendoswitch* AND product_code_txt:*',
      "fq":
          "type:GAME AND ((playable_on_txt:\"HAC\")) AND sorting_title:* AND *:*",
      "sort": "score desc, date_from desc",
      "start": "${page * size}",
      "rows": "$size",
      "wt": "json",
      "json.wrf": wrf,
    });

    final gameSearchResponse = await _httpClient.get(
      appDetailsRequest,
      headers: {"access-control-allow-origin": "http://nintendo-europe.com"},
    );
    if (gameSearchResponse.statusCode != HttpStatus.ok) {
      throw GamesSearchRequestFailure();
    }
    final trimmedGamedSearchBody = _trimJsonp(gameSearchResponse.body, wrf);
    Map gameSearchJson;
    try {
      gameSearchJson = jsonDecode(trimmedGamedSearchBody) as Map;
    } catch (e) {
      throw GamesSearchParsingFailure();
    }

    if (!gameSearchJson.containsKey("response") ||
        !gameSearchJson["response"].containsKey("docs"))
      throw GamesSearchEmptyResponseFailure();

    final gameSearchResultJson = GameSearchResponse.fromJson(
      gameSearchJson["response"],
    );

    return gameSearchResultJson.games;
  }

  /// The Game search response returns a js/jsonb serializable data, which must be trimmed in order to parse it
  /// correctly as json.
  String _trimJsonp(String message, String wrf) {
    message = message.replaceFirst(wrf, "");
    message = message.substring(1);
    while (!message.endsWith("}")) {
      message = message.substring(0, message.length - 1);
    }
    return message;
  }

  /// Queries the prices information for the game based on [nsuId]
  /// [nsuId] corresponds to the `nsuid` of the game.
  Future<GamePricePrice> getPrice(String nsuId) async {
    final gamePriceRequest = Uri.https(
      _basePriceUrlNintendoEshop,
      "/v1/price",
      {"country": "DE", "lang": "de", "ids": nsuId},
    );

    final gameSearchResponse = await _httpClient.get(gamePriceRequest);
    if (gameSearchResponse.statusCode != HttpStatus.ok) {
      throw GamesSearchRequestFailure();
    }

    Map<String, dynamic> gameSearchJson;
    try {
      gameSearchJson =
          jsonDecode(gameSearchResponse.body) as Map<String, dynamic>;
    } catch (_) {
      throw GamesSearchParsingFailure();
    }

    if (!gameSearchJson.containsKey("prices")) {
      throw GamesSearchEmptyResponseFailure();
    }

    final gameSearchResultJson = GamePriceResponse.fromJson(gameSearchJson);

    try {
      final gamePrice = gameSearchResultJson.prices.firstWhere(
        (price) => "${price.titleId}" == nsuId,
      );
      return gamePrice;
    } catch (_) {
      throw GamesPriceNotFoundFailure();
    }
  }

  /// Queries the prices information for the game based on [nsuId]
  /// [nsuId] corresponds to the `nsuid` of the game.
  Future<Map<String, GamePricePrice>> getPrices(List<String> nsuIds) async {
    final gamePriceRequest = Uri.https(
      _basePriceUrlNintendoEshop,
      "/v1/price",
      {"country": "DE", "lang": "de", "ids": nsuIds.join(",")},
    );

    final gameSearchResponse = await _httpClient.get(
      gamePriceRequest,
      headers: {
        "accept-language": "en-GB,en;q=0.8",
        "accept-encoding": "gzip, deflate, br, zstd",
      },
    );
    if (gameSearchResponse.statusCode != HttpStatus.ok) {
      throw GamesSearchRequestFailure();
    }

    Map<String, dynamic> gameSearchJson;
    try {
      gameSearchJson =
          jsonDecode(gameSearchResponse.body) as Map<String, dynamic>;
    } catch (_) {
      throw GamesSearchParsingFailure();
    }

    if (!gameSearchJson.containsKey("prices")) {
      throw GamesSearchEmptyResponseFailure();
    }

    final gameSearchResultJson = GamePriceResponse.fromJson(gameSearchJson);

    final Map<String, GamePricePrice> gamePrices = {};

    for (final game in gameSearchResultJson.prices) {
      gamePrices["${game.titleId}"] = game;
    }
    return gamePrices;
  }
}
