import 'package:steamstore_api/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('AppDetails', () {
    group('fromJson', () {
      test('returns complete AppDetails object', () {
        expect(
          AppDetails.fromJson(<String, dynamic>{
            "type": "game",
            "name": "Monstrum",
            "steam_appid": 296710,
            "capsule_imagev5":
                "https:\/\/shared.akamai.steamstatic.com\/store_item_assets\/steam\/apps\/296710\/capsule_184x69.jpg",
            "price_overview": {
              "currency": "EUR",
              "initial": 1499,
              "final": 299,
              "discount_percent": 80,
              "initial_formatted": "14,99€",
              "final_formatted": "2,99€",
            },
          }),
          isA<AppDetails>()
              .having((a) => a.name, "name", "Monstrum")
              .having((a) => a.steamAppId, "steamAppId", 296710)
              .having(
                (a) => a.capsuleImage,
                "capsuleImage",
                contains("store_item_assets\/steam\/apps\/296710"),
              )
              .having(
                (a) => a.priceOverview,
                "priceOverview",
                isA<PriceOverview>()
                    .having((p) => p.currency, "currency", "EUR")
                    .having((p) => p.initialPrice, "initialPrice", 1499)
                    .having((p) => p.finalPrice, "finalPrice", 299)
                    .having((p) => p.discountPercent, "discountPercent", 80)
                    .having(
                      (p) => p.initialPriceFormatted,
                      "initialPriceFormatted",
                      "14,99€",
                    )
                    .having(
                      (p) => p.finalPriceFormatted,
                      "finalPriceFormatted",
                      "2,99€",
                    ),
              ),
        );
      });

      test('returns AppDetails with only PriceOverview object', () {
        expect(
          AppDetails.fromJson(<String, dynamic>{
            "price_overview": {
              "currency": "EUR",
              "initial": 1499,
              "final": 299,
              "discount_percent": 80,
              "initial_formatted": "14,99€",
              "final_formatted": "2,99€",
            },
          }),
          isA<AppDetails>()
              .having((a) => a.name, "name", null)
              .having((a) => a.steamAppId, "steamAppId", null)
              .having(
                (a) => a.priceOverview,
                "priceOverview",
                isA<PriceOverview>()
                    .having((p) => p.currency, "currency", "EUR")
                    .having((p) => p.initialPrice, "initialPrice", 1499)
                    .having((p) => p.finalPrice, "finalPrice", 299)
                    .having((p) => p.discountPercent, "discountPercent", 80)
                    .having(
                      (p) => p.initialPriceFormatted,
                      "initialPriceFormatted",
                      "14,99€",
                    )
                    .having(
                      (p) => p.finalPriceFormatted,
                      "finalPriceFormatted",
                      "2,99€",
                    ),
              ),
        );
      });
    });
  });
}
