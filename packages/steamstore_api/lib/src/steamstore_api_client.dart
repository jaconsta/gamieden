import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:steamstore_api/steamstore_api.dart';

/// Exception thrown when the query fails.
class AppDetailsRequestFailure implements Exception {}

/// Exception thrown when the provided appId didn't is not found.
class AppDetailsNotFoundFailure implements Exception {}

/// {@template steam_store_api_client}
/// Dart API client to wrap the games search from [Steam Store](https://store.steampowered.com)
/// {@endtemplate}
class SteamStoreApiClient {
  final http.Client _httpClient;

  static const _baseUrlSteamStore = "store.steampowered.com";

  /// {@macro steam_store_api_client}
  SteamStoreApiClient({http.Client? httpClient})
    : _httpClient = httpClient ?? http.Client();

  /// Finds an [AppDetails] `/api/appdetails?appids=(query)`
  Future<AppDetails> appDetailsSearch(String appIdQuery) async {
    final appDetailsRequest = Uri.https(_baseUrlSteamStore, "/api/appdetails", {
      "appids": appIdQuery,
    });

    final appDetailsResponse = await _httpClient.get(appDetailsRequest);

    if (appDetailsResponse.statusCode != HttpStatus.ok) {
      throw AppDetailsRequestFailure();
    }

    final appDetailsJson = jsonDecode(appDetailsResponse.body) as Map;

    // The API should always return the [appIdQuery] key.
    if (!appDetailsJson.containsKey(appIdQuery))
      throw AppDetailsNotFoundFailure();

    final appDetailsResultJson =
        appDetailsJson[appIdQuery] as Map<String, dynamic>;

    final appIdDetails = AppIdResponse.fromJson(appDetailsResultJson);

    if (!appIdDetails.success) throw AppDetailsNotFoundFailure();

    final appDetails = appIdDetails.appDetails;
    appDetails.id = appIdQuery;
    return appDetails;
  }

  /// Finds an [AppDetails] `/api/appdetails?appids=(queryId1,queryId2)`
  /// Consider this [AppDetails] only include [PriceOverview] information.
  /// To get all information about a game use [appDetailsSearch].
  Future<Map<String, AppDetails>> appDetailsPricesSearch(
    List<String> appIdQueries,
  ) async {
    // Seems to be by design. If looking for many appdetails.
    // Only priceOverview can be queried.
    final appDetailsRequest = Uri.https(_baseUrlSteamStore, "/api/appdetails", {
      "appids": appIdQueries.join(","),
      "filters": "price_overview",
    });

    final appDetailsResponse = await _httpClient.get(appDetailsRequest);

    if (appDetailsResponse.statusCode != HttpStatus.ok) {
      throw AppDetailsRequestFailure();
    }

    final appDetailsJson = jsonDecode(appDetailsResponse.body) as Map;
    Map<String, AppDetails> appDetails = Map();

    appIdQueries.forEach((appId) {
      // The API should always return the [appIdQuery] key.
      if (!appDetailsJson.containsKey(appId)) return;

      final appDetailsResultJson =
          appDetailsJson[appId] as Map<String, dynamic>;

      final appIdDetails = AppIdResponse.fromJson(appDetailsResultJson);

      if (!appIdDetails.success) return;

      final appIdDetail = appIdDetails.appDetails;
      appIdDetail.id = appId;
      appDetails[appId] = appIdDetail;
    });

    return appDetails;
  }
}
