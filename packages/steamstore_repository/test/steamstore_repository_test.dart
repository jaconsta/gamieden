import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:steamstore_api/steamstore_api.dart' as steamstore_api;

import 'package:steamstore_repository/steamstore_repository.dart';

class MockSteamStoreApiClient extends Mock
    implements steamstore_api.SteamStoreApiClient {}

class MockAppDetails extends Mock implements steamstore_api.AppDetails {}

void main() {
  group("steamStore repository", () {
    late steamstore_api.SteamStoreApiClient steamStoreApiClient;
    late SteamstoreRepository steamstoreRepository;

    setUp(() {
      steamStoreApiClient = MockSteamStoreApiClient();
      steamstoreRepository = SteamstoreRepository(
        storeApiClient: steamStoreApiClient,
      );
    });

    group("Constructor", () {
      test("Initializes with default paramenters", () {
        expect(SteamstoreRepository(), isNotNull);
      });
    });

    group("get One", () {
      const name = "Monstrous";
      const gameId = "45364";
      const fullPrice = "14,99€";
      const currentPrice = "2,99€";
      const coverImage = "blob.storage.com/1.jpg";
      const discountPercent = 80;

      test("calls steam api with correct gameId", () async {
        try {
          await steamstoreRepository.getOne(gameId);
        } catch (_) {}

        verify(() => steamStoreApiClient.appDetailsSearch(gameId)).called(1);
      });

      test("throws when gameId is not found", () {
        final exception = Exception("Not found");

        // Real exception types are defined in Client file.
        when(
          () => steamStoreApiClient.appDetailsSearch(any()),
        ).thenThrow(exception);

        expect(
          () async => steamstoreRepository.getOne("11111"),
          throwsA(exception),
        );
      });

      test("gets request game details", () async {
        final appDetails = MockAppDetails();
        when(() => appDetails.id).thenReturn(gameId);
        when(() => appDetails.name).thenReturn(name);
        when(() => appDetails.capsuleImage).thenReturn(coverImage);
        when(() => appDetails.priceOverview).thenReturn(
          steamstore_api.PriceOverview(
            currency: "",
            initialPrice: 0,
            finalPrice: 0,
            discountPercent: 0,
            initialPriceFormatted: fullPrice,
            finalPriceFormatted: currentPrice,
          ),
        );
        when(
          () => steamStoreApiClient.appDetailsSearch(any()),
        ).thenAnswer((_) async => appDetails);

        final game = await steamstoreRepository.getOne(gameId);

        expect(
          game,
          SteamGame(
            name: name,
            steamId: gameId,
            fullPrice: fullPrice,
            currentPrice: currentPrice,
            discountPercent: discountPercent,
            coverImage: coverImage,
          ),
        );
      });
    });

    group("get many prices", () {
      Map<String, steamstore_api.AppDetails> appPrices = {
        "111": steamstore_api.AppDetails(
          priceOverview: steamstore_api.PriceOverview(
            currency: "EUR",
            initialPrice: 111,
            finalPrice: 11,
            discountPercent: 9,
            initialPriceFormatted: "11.1 €",
            finalPriceFormatted: "1.1 €",
          ),
        )..id = "111",
        "122": steamstore_api.AppDetails(
          priceOverview: steamstore_api.PriceOverview(
            currency: "EUR",
            initialPrice: 222,
            finalPrice: 22,
            discountPercent: 2,
            initialPriceFormatted: "222 €",
            finalPriceFormatted: "22 €",
          ),
        )..id = "122",
      };

      test("calls steam api with correct gameIds", () async {
        try {
          await steamstoreRepository.getPrices(["121", "122"]);
        } catch (_) {}

        verify(
          () => steamStoreApiClient.appDetailsPricesSearch(["121", "122"]),
        ).called(1);
      });

      test("gets request game prices", () async {
        final Map<String, MockAppDetails> appDetails = {
          "111": MockAppDetails(),
          "122": MockAppDetails(),
        };
        when(() => appDetails["111"]!.id).thenReturn(appPrices["111"]!.id);
        when(
          () => appDetails["111"]!.priceOverview,
        ).thenReturn(appPrices["111"]!.priceOverview);
        when(() => appDetails["122"]!.id).thenReturn(appPrices["122"]!.id);
        when(
          () => appDetails["122"]!.priceOverview,
        ).thenReturn(appPrices["122"]!.priceOverview);

        when(
          () => steamStoreApiClient.appDetailsPricesSearch(any()),
        ).thenAnswer((_) async => appDetails);

        final game = await steamstoreRepository.getPrices(["111", "122"]);

        expect(game, {
          "111": Price(
            gameId: appPrices["111"]!.id,
            fullPrice: appPrices["111"]!.priceOverview.initialPriceFormatted,
            currentPrice: appPrices["111"]!.priceOverview.finalPriceFormatted,
            discountPercent: appPrices["111"]!.priceOverview.discountPercent,
          ),
          "122": Price(
            gameId: appPrices["122"]!.id,
            fullPrice: appPrices["122"]!.priceOverview.initialPriceFormatted,
            currentPrice: appPrices["122"]!.priceOverview.finalPriceFormatted,
            discountPercent: appPrices["122"]!.priceOverview.discountPercent,
          ),
        });
      });
    });
  });
}
