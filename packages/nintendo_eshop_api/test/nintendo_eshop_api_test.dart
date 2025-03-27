import "package:http/http.dart" as http;
import "package:mocktail/mocktail.dart";
import 'package:test/test.dart';

import 'package:nintendo_eshop_api/nintendo_eshop_api.dart';

class MockHttpClient extends Mock implements http.Client {
  Future<http.Response> get(Uri url, {Map<String, String>? headers});
}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group("NintendoEshopApiClient", () {
    late http.Client httpClient;
    late NintendoEshopApiClient apiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      apiClient = NintendoEshopApiClient(httpClient: httpClient);
    });

    group("get gameSearch", () {
      test("Makes the call to the http request", () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn("{}");
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await apiClient.gameSearch("any name");
        } catch (_) {}

        verify(
          () => httpClient.get(
            Uri.https("searching.nintendo-europe.com", "/de/select", {
              "q": "any name",
              "fq":
                  'type:GAME AND system_type:nintendoswitch* AND product_code_txt:*',
              "sort": "score desc, date_from desc",
              "start": "0",
              "rows": "2",
              "wt": "json",
              "json.wrf": "json",
            }),
            headers: {
              "access-control-allow-origin": "http://nintendo-europe.com",
            },
          ),
        ).called(1);
      });
      test("Query the game by list", () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(game_search_not_a_game);
        when(
          () => httpClient.get(any(), headers: any(named: "headers")),
        ).thenAnswer((_) async => response);

        final gamesList = await apiClient.gameSearch("any name");

        expect(
          gamesList[0],
          isA<GameSearchDetails>()
              .having((g) => g.nsuIds, "nsuIds", ["70010000039845"])
              .having((g) => g.fsId, "fsId", "1948885")
              .having((g) => g.name, "name", "Thief's Shelter")
              .having((g) => g.priceRegular, "price Regular", null),
        );
        expect(
          gamesList[1],
          isA<GameSearchDetails>()
              .having((g) => g.nsuIds, "nsuIds", ["70010000070473"])
              .having((g) => g.fsId, "fsId", "2556150")
              .having((g) => g.name, "name", "Doctor Cat")
              .having((g) => g.priceRegular, "price Regular", 4.99),
        );
      });
      test(
        "Query a game with multiple versions (and DLC not visible)",
        () async {
          final response = MockResponse();
          when(() => response.statusCode).thenReturn(200);
          when(() => response.body).thenReturn(game_search_with_editions);
          when(
            () => httpClient.get(any(), headers: any(named: "headers")),
          ).thenAnswer((_) async => response);

          final gamesList = await apiClient.gameSearch("any name");

          expect(
            gamesList[0],
            isA<GameSearchDetails>()
                .having((g) => g.nsuIds, "nsuIds", [
                  '70010000021931',
                  '70070000011297',
                ])
                .having((g) => g.fsId, "fsId", "1864799")
                .having((g) => g.name, "name", "IMMORTALS FENYX RISING")
                .having((g) => g.priceRegular, "price Regular", 59.99)
                .having((g) => g.priceDiscount, "price Discount", 7.99)
                .having((g) => g.discountPercent, "discount percent", 87.0),
          );
        },
      );
    });
    group("get gamePrice", () {
      test("Makes the call to the http request", () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn("{}");
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await apiClient.getPrice("7000123");
        } catch (_) {}

        verify(
          () => httpClient.get(
            Uri.https("api.ec.nintendo.com", "/v1/price", {
              "country": "DE",
              "lang": "de",
              "ids": "7000123",
            }),
          ),
        ).called(1);
      });

      test("Query the game with discount", () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(game_price_70010000001128);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        final gamePrice = await apiClient.getPrice("70010000001128");

        expect(
          gamePrice,
          isA<GamePricePrice>()
              .having((p) => p.titleId, "titleId", 70010000001128)
              .having(
                (p) => p.regularPrice?.amount,
                "regularPrice amount",
                "9,99 €",
              )
              .having(
                (p) => p.discountPrice?.amount,
                "discountPrice amount",
                "0,99 €",
              )
              .having(
                (p) => p.discountPrice?.endDatetime,
                "discountPrice endDatetime",
                "2025-03-24T22:59:59Z",
              ),
        );
      });
      test("Query the game without discount", () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(game_price_70010000058875);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        final gamePrice = await apiClient.getPrice("70010000058875");

        expect(
          gamePrice,
          isA<GamePricePrice>()
              .having((p) => p.titleId, "titleId", 70010000058875)
              .having(
                (p) => p.regularPrice?.amount,
                "regularPrice amount",
                "3,99 €",
              )
              .having((p) => p.discountPrice, "discountPrice", null),
        );
      });

      test("Queryed game not found", () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(game_price_70010000058875);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        try {
          await apiClient.getPrice("700100000123");
        } catch (e) {
          expect(e, isA<GamesPriceNotFoundFailure>());
        }
      });
    });

    group("get gamePrice", () {
      test("Makes the call to the http request", () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(
          () => response.body,
        ).thenReturn(game_prices_70010000039845_70010000070473);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);

        final gamePrice = await apiClient.getPrices([
          "70010000039845",
          "70010000070473",
        ]);
        // Validate gamePrice

        expect(
          gamePrice["70010000039845"],
          isA<GamePricePrice>()
              .having((p) => p.titleId, "titleId", 70010000039845)
              .having((p) => p.salesStatus, "sales status", "unreleased")
              .having((p) => p.regularPrice, "regular price", null),
        );
        expect(
          gamePrice["70010000070473"],
          isA<GamePricePrice>()
              .having((p) => p.titleId, "titleId", 70010000070473)
              .having((p) => p.salesStatus, "sales status", "onsale")
              .having(
                (p) => p.regularPrice,
                "regular price",
                isA<RegularPrice>().having(
                  (rp) => rp.amount,
                  "Regular price amount",
                  "4,99 €",
                ),
              ),
        );
      });
    });
  });
}

const String game_search_not_a_game = """
json({
  "responseHeader":{
    "status":0,
    "QTime":0,
    "params":{
      "q":"*",
      "json.wrf":"json",
      "start":"0",
      "fq":"type:GAME AND system_type:nintendoswitch* AND product_code_txt:*",
      "sort":"score desc, date_from desc",
      "rows":"2",
      "wt":"json"}},
  "response":{"numFound":8789,"start":0,"numFoundExact":true,"docs":[
      {
        "fs_id":"1948885",
        "change_date":"2022-01-17T10:56:26Z",
        "url":"/de-de/Spiele/Nintendo-Switch-Download-Software/Thief-s-Shelter-1948885.html",
        "type":"GAME",
        "dates_released_dts":["2050-12-31T00:00:00Z"],
        "club_nintendo":false,
        "pretty_date_s":"n. n. b.",
        "play_mode_tv_mode_b":true,
        "play_mode_handheld_mode_b":true,
        "product_code_txt":["HACPA2TCA"],
        "image_url_sq_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/SQ_NSwitchDS_ThiefsShelter_image500w.jpg",
        "deprioritise_b":false,
        "demo_availability":true,
        "pg_s":"GAME",
        "image_url":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/SQ_NSwitchDS_ThiefsShelter_image500w.jpg",
        "originally_for_t":"HAC",
        "paid_subscription_required_b":false,
        "cloud_saves_b":false,
        "priority":"2031-03-31T15:45:05Z",
        "digital_version_b":true,
        "title_extras_txt":["Thief's Shelter"],
        "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_ThiefsShelter_image500w.jpg",
        "system_type":["nintendoswitch_downloadsoftware"],
        "age_rating_sorting_i":12,
        "game_categories_txt":["action",
          "adventure",
          "puzzle"],
        "play_mode_tabletop_mode_b":true,
        "publisher":"Restless Corp",
        "product_code_ss":["HACPA2TCA"],
        "excerpt":"3D Point & Click hybrid storytelling game",
        "nsuid_txt":["70010000039845"],
        "date_from":"2050-12-31T00:00:00Z",
        "language_availability":["english"],
        "product_catalog_description_s":"3D Point & Click hybrid storytelling game",
        "related_nsuids_txt":["70010000039845"],
        "price_discount_percentage_f":0.0,
        "title":"Thief's Shelter",
        "sorting_title":"Thief's Shelter",
        "wishlist_email_square_image_url_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/SQ_NSwitchDS_ThiefsShelter_square_image_wishlist.jpg",
        "players_to":1,
        "wishlist_email_banner640w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_ThiefsShelter_banner_image_wishlist_640w.jpg",
        "paid_subscription_online_play_b":false,
        "playable_on_txt":["HAC"],
        "hits_i":300,
        "pretty_game_categories_txt":["Action",
          "Adventure",
          "Puzzle"],
        "title_master_s":"Thief's Shelter",
        "switch_game_voucher_b":false,
        "game_category":["puzzle,adventure,action"],
        "system_names_txt":["Nintendo Switch"],
        "pretty_agerating_s":"USK ab 12 Jahren",
        "eshop_removed_b":false,
        "age_rating_type":"usk",
        "price_sorting_f":999999.0,
        "price_lowest_f":-1.0,
        "age_rating_value":"12",
        "physical_version_b":false,
        "wishlist_email_banner460w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/H2x1_NSwitchDS_ThiefsShelter_banner_image_wishlist_460w.jpg",
        "downloads_rank_i":999999,
        "_version_":1827033331517095963},
      {
        "fs_id":"2556150",
        "change_date":"2024-04-19T08:57:36Z",
        "url":"/de-de/Spiele/Nintendo-Switch-Download-Software/Doctor-Cat-2556150.html",
        "type":"GAME",
        "dates_released_dts":["2050-12-31T00:00:00Z"],
        "club_nintendo":false,
        "pretty_date_s":"n. n. b.",
        "play_mode_tv_mode_b":true,
        "play_mode_handheld_mode_b":true,
        "product_code_txt":["HACPBECZA"],
        "image_url_sq_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/1x1_NSwitchDS_DoctorCat_image500w.jpg",
        "deprioritise_b":false,
        "demo_availability":false,
        "pg_s":"GAME",
        "compatible_controller":["nintendoswitch_pro_controller"],
        "originally_for_t":"HAC",
        "paid_subscription_required_b":false,
        "cloud_saves_b":true,
        "priority":"2034-04-24T22:00:00Z",
        "digital_version_b":true,
        "title_extras_txt":["Doctor Cat"],
        "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/2x1_NSwitchDS_DoctorCat_image500w.jpg",
        "system_type":["nintendoswitch_downloadsoftware"],
        "age_rating_sorting_i":6,
        "game_categories_txt":["lifestyle",
          "other",
          "puzzle"],
        "play_mode_tabletop_mode_b":true,
        "publisher":"Afil Games",
        "product_code_ss":["HACPBECZA"],
        "excerpt":"Verliebe dich in bezaubernde Katzen, überwinde echte Traumata und habe Spaß!",
        "nsuid_txt":["70010000070473"],
        "date_from":"2050-12-31T00:00:00Z",
        "language_availability":["english, portuguese"],
        "price_has_discount_b":false,
        "product_catalog_description_s":"Verliebe dich in bezaubernde Katzen, überwinde echte Traumata und habe Spaß!",
        "related_nsuids_txt":["70010000070473"],
        "price_discount_percentage_f":0.0,
        "title":"Doctor Cat",
        "sorting_title":"Doctor Cat",
        "wishlist_email_square_image_url_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_download_software/1x1_NSwitchDS_DoctorCat_square_image_wishlist.jpg",
        "players_to":1,
        "wishlist_email_banner640w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/2x1_NSwitchDS_DoctorCat_banner_image_wishlist_640w.jpg",
        "paid_subscription_online_play_b":false,
        "playable_on_txt":["HAC"],
        "hits_i":300,
        "pretty_game_categories_txt":["Andere",
          "Lifestyle",
          "Puzzle"],
        "title_master_s":"Doctor Cat",
        "switch_game_voucher_b":false,
        "game_category":["puzzle,other,lifestyle"],
        "system_names_txt":["Nintendo Switch"],
        "pretty_agerating_s":"USK ab 6 Jahren",
        "price_regular_f":4.99,
        "eshop_removed_b":false,
        "age_rating_type":"usk",
        "price_sorting_f":4.99,
        "price_lowest_f":4.99,
        "age_rating_value":"6",
        "physical_version_b":false,
        "wishlist_email_banner460w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_download_software_1/2x1_NSwitchDS_DoctorCat_banner_image_wishlist_460w.jpg",
        "downloads_rank_i":20900,
        "_version_":1827033461742895155}]
  }})
""";
const String game_search_with_editions = """
json({
  "responseHeader":{
    "status":0,
    "QTime":1,
    "params":{
      "q":"IMMORTALS FENYX RISING",
      "json.wrf":"nindo.net.jsonp.jsonpCallback_704",
      "bf":"linear(ms(priority,NOW/HOUR),3.19e-11,0)",
      "start":"0",
      "fq":"type:GAME AND sorting_title:* AND *:*",
      "sort":"score desc, date_from desc",
      "rows":"24",
      "wt":"json",
      "bq":"!deprioritise_b:true^999"}},
  "response":{"numFound":105,"start":0,"numFoundExact":true,"docs":[
      {
        "fs_id":"1864799",
        "change_date":"2023-04-21T09:44:30Z",
        "url":"/de-de/Spiele/Nintendo-Switch-Spiele/IMMORTALS-FENYX-RISING-1864799.html",
        "type":"GAME",
        "dates_released_dts":["2020-12-03T00:00:00Z"],
        "club_nintendo":false,
        "pretty_date_s":"03.12.2020",
        "play_mode_tv_mode_b":true,
        "play_mode_handheld_mode_b":true,
        "product_code_txt":["HACPAU84A",
          "HACYAU84H"],
        "image_url_sq_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_5/SQ_NSwitch_ImmortalisFenixRising_image500w.jpg",
        "deprioritise_b":false,
        "demo_availability":true,
        "pg_s":"GAME",
        "add_on_content_b":false,
        "compatible_controller":["nintendoswitch_pro_controller"],
        "image_url":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_5/SQ_NSwitch_ImmortalisFenixRising_image500w.jpg",
        "originally_for_t":"HAC",
        "paid_subscription_required_b":false,
        "cloud_saves_b":true,
        "priority":"2030-12-02T23:00:00Z",
        "digital_version_b":false,
        "title_extras_txt":["IMMORTALS FENYX RISING"],
        "price_discounted_f":7.99,
        "image_url_h2x1_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_ImmortalisFenixRising_image500w.jpg",
        "system_type":["nintendoswitch_digitaldistribution,nintendoswitch_digitaldistribution,nintendoswitch_gamecard"],
        "age_rating_sorting_i":12,
        "game_categories_txt":["adventure"],
        "play_mode_tabletop_mode_b":true,
        "publisher":"Ubisoft",
        "product_code_ss":["HACPAU84A",
          "HACYAU84H"],
        "excerpt":"Spiele als Fenyx und rette die griechischen Götter vor einem dunklen Fluch.",
        "nsuid_txt":["70010000021931",
          "70070000011297"],
        "date_from":"2020-12-03T00:00:00Z",
        "dlc_shown_b":true,
        "language_availability":["english, spanish, french, german, italian, dutch, portuguese, russian"],
        "price_has_discount_b":true,
        "product_catalog_description_s":"Spiele als Fenyx und rette die griechischen Götter vor einem dunklen Fluch.",
        "related_nsuids_txt":["70010000021931",
          "70070000011297"],
        "price_discount_percentage_f":87.0,
        "title":"IMMORTALS FENYX RISING",
        "sorting_title":"IMMORTALS FENYX RISING",
        "wishlist_email_square_image_url_s":"https://www.nintendo.com/eu/media/images/11_square_images/games_18/nintendo_switch_5/SQ_NSwitch_ImmortalisFenixRising_square_image_wishlist.jpg",
        "players_to":1,
        "wishlist_email_banner640w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_ImmortalisFenixRising_banner_image_wishlist_640w.jpg",
        "paid_subscription_online_play_b":false,
        "playable_on_txt":["HAC"],
        "hits_i":300,
        "pretty_game_categories_txt":["Adventure"],
        "title_master_s":"IMMORTALS FENYX RISING",
        "switch_game_voucher_b":false,
        "game_category":["adventure"],
        "system_names_txt":["Nintendo Switch"],
        "pretty_agerating_s":"USK ab 12 Jahren",
        "price_regular_f":59.99,
        "eshop_removed_b":false,
        "age_rating_type":"usk",
        "price_sorting_f":7.99,
        "price_lowest_f":7.99,
        "age_rating_value":"12",
        "physical_version_b":true,
        "wishlist_email_banner460w_image_url_s":"https://www.nintendo.com/eu/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_ImmortalisFenixRising_banner_image_wishlist_460w.jpg",
        "downloads_rank_i":163,
        "_version_":1826100890002522130}]
  }})
""";
const String game_price_70010000001128 =
    """{"personalized":false,"country":"DE","prices":[{"title_id":70010000001128,"sales_status":"onsale","regular_price":{"amount":"9,99 €","currency":"EUR","raw_value":"9.99"},"discount_price":{"amount":"0,99 €","currency":"EUR","raw_value":"0.99","start_datetime":"2025-02-24T14:00:00Z","end_datetime":"2025-03-24T22:59:59Z"},"gold_point":{"basic_gift_gp":"5","basic_gift_rate":"0.05","consume_gp":"0","extra_gold_points":[],"gift_gp":"5","gift_rate":"0.05"}}]}""";
const String game_price_70010000058875 =
    """{"personalized":false,"country":"DE","prices":[{"title_id":70010000058875,"sales_status":"onsale","regular_price":{"amount":"3,99 €","currency":"EUR","raw_value":"3.99"},"gold_point":{"basic_gift_gp":"20","basic_gift_rate":"0.05","consume_gp":"0","extra_gold_points":[],"gift_gp":"20","gift_rate":"0.05"}}]}""";
const String game_prices_70010000039845_70010000070473 = """
{"personalized":false,"country":"DE","prices":[{"title_id":70010000039845,"sales_status":"unreleased"},{"title_id":70010000070473,"sales_status":"onsale","regular_price":{"amount":"4,99 €","currency":"EUR","raw_value":"4.99"},"gold_point":{"basic_gift_gp":"0","basic_gift_rate":"0","consume_gp":"0","extra_gold_points":[],"gift_gp":"0","gift_rate":"0"}}]}
""";
