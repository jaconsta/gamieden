import 'package:bloc_test/bloc_test.dart';
import 'package:gamieden/steamstore/cubit/steam_game_cubit.dart';
import 'package:gamieden/steamstore/models/models.dart' show SteamGame;
import 'package:mocktail/mocktail.dart';

import 'package:steamstore_repository/steamstore_repository.dart'
    as steamstore_repository;
import 'package:test/test.dart';

import '../../helpers/hydrated_bloc.dart';

class MockSteamstoreRepository extends Mock
    implements steamstore_repository.SteamstoreRepository {}

class MockSteamGame extends Mock implements steamstore_repository.SteamGame {}

class MockSteamPrice extends Mock
    implements Map<String, steamstore_repository.Price> {}

void main() {
  initHydratedStorage();

  group("SteamStore GameCubit", () {
    late steamstore_repository.SteamstoreRepository steamStoreRepository;
    late steamstore_repository.SteamGame steamGame;
    late Map<String, steamstore_repository.Price> steamPrice;
    late SteamGameCubit gameCubit;

    setUp(() async {
      steamGame = MockSteamGame();
      steamPrice = MockSteamPrice();
      steamStoreRepository = MockSteamstoreRepository();
      when(() => steamGame.steamId).thenReturn("123");
      when(() => steamGame.name).thenReturn("Mounstrous");
      when(() => steamGame.fullPrice).thenReturn("111");
      when(() => steamGame.currentPrice).thenReturn("100");
      when(() => steamGame.discountPercent).thenReturn(20);
      when(() => steamGame.coverImage).thenReturn("url.com");
      //
      when(() => steamPrice["123"]).thenReturn(
        steamstore_repository.Price(
          gameId: "123",
          fullPrice: "200 €",
          currentPrice: "100 €",
          discountPercent: 80,
        ),
      );
      //
      when(
        () => steamStoreRepository.getOne(any()),
      ).thenAnswer((_) async => steamGame);
      when(
        () => steamStoreRepository.getPrices(any()),
      ).thenAnswer((_) async => steamPrice);

      gameCubit = SteamGameCubit(steamStoreRepository);
    });

    test("Initial state", () {
      final gameCubit = SteamGameCubit(steamStoreRepository);
      expect(gameCubit.state, SteamGameState());
    });

    group("fetch description", () {
      blocTest<SteamGameCubit, SteamGameState>(
        "Emits nothing when gameId is empty",
        build: () => gameCubit,
        act: (cubit) => cubit.getGame(""),
        expect: () => <SteamGameState>[],
      );

      blocTest<SteamGameCubit, SteamGameState>(
        "Emits error when gameid is not int parseable",
        build: () => gameCubit,
        act: (cubit) => cubit.getGame("abc"),
        expect:
            () => <SteamGameState>[
              SteamGameState(
                status: SteamGameStatus.failure,
                errorMessage: "gameId_not_a_number",
              ),
            ],
      );

      blocTest<SteamGameCubit, SteamGameState>(
        "Emits [loading, success] when currect gameId",
        build: () => gameCubit,
        act: (cubit) => cubit.getGame("123"),
        expect:
            () => <dynamic>[
              SteamGameState(status: SteamGameStatus.loading),
              isA<SteamGameState>()
                  .having((s) => s.status, "status", SteamGameStatus.success)
                  .having(
                    (s) => s.game,
                    "game",
                    isA<SteamGame>().having((g) => g.steamId, "steamId", "123"),
                  ),
            ],
      );
    });

    group("Set price", () {
      blocTest<SteamGameCubit, SteamGameState>(
        "Sets the game new price",
        build: () => gameCubit,
        seed:
            () => SteamGameState(
              status: SteamGameStatus.success,
              errorMessage: "",
              game: SteamGame(
                name: "Monstrous",
                steamId: "123",
                coverImage: "url.com",
                fullPrice: "999 €",
              ),
            ),
        act: (cubit) => cubit.setPrices("111 €", "99 €", 10),
        expect:
            () => <dynamic>[
              isA<SteamGameState>()
                  .having((s) => s.status, "status", SteamGameStatus.success)
                  .having(
                    (s) => s.game,
                    "game",
                    isA<SteamGame>()
                        .having((g) => g.fullPrice, "full price", "111 €")
                        .having((g) => g.currentPrice, "discount price", "99 €")
                        .having(
                          (g) => g.discountPercent,
                          "discount percent",
                          10,
                        ),
                  ),
            ],
      );
    });

    group("Update game price", () {
      blocTest<SteamGameCubit, SteamGameState>(
        "Sets the game new price",
        build: () => gameCubit,
        seed:
            () => SteamGameState(
              status: SteamGameStatus.success,
              errorMessage: "",
              game: SteamGame(
                name: "Monstrous",
                steamId: "123",
                coverImage: "url.com",
                fullPrice: "999 €",
              ),
            ),
        act: (cubit) => cubit.getPrice(),
        expect:
            () => <dynamic>[
              isA<SteamGameState>().having(
                (s) => s.status,
                "status",
                SteamGameStatus.loading,
              ),
              isA<SteamGameState>()
                  .having((s) => s.status, "status", SteamGameStatus.success)
                  .having(
                    (s) => s.game,
                    "game",
                    isA<SteamGame>()
                        .having((g) => g.fullPrice, "full price", "200 €")
                        .having(
                          (g) => g.currentPrice,
                          "discount price",
                          "100 €",
                        )
                        .having(
                          (g) => g.discountPercent,
                          "discount percent",
                          80,
                        ),
                  ),
            ],
      );

      blocTest<SteamGameCubit, SteamGameState>(
        "Nothing happens when Game.empty",
        build: () => gameCubit,
        seed:
            () => SteamGameState(
              status: SteamGameStatus.success,
              errorMessage: "",
              game: SteamGame(
                name: "",
                steamId: "",
                coverImage: "",
                fullPrice: "",
              ),
            ),
        act: (cubit) => cubit.getPrice(),
        expect: () => <SteamGameState>[],
      );
      blocTest<SteamGameCubit, SteamGameState>(
        "Emit an error when gameId does not exist",
        build: () => gameCubit,
        seed:
            () => SteamGameState(
              status: SteamGameStatus.success,
              errorMessage: "",
              game: SteamGame(
                name: "",
                steamId: "111",
                coverImage: "",
                fullPrice: "",
              ),
            ),
        act: (cubit) => cubit.getPrice(),
        expect:
            () => <dynamic>[
              isA<SteamGameState>().having(
                (s) => s.status,
                "status",
                SteamGameStatus.loading,
              ),
              isA<SteamGameState>()
                  .having((s) => s.status, "status", SteamGameStatus.failure)
                  .having(
                    (s) => s.errorMessage,
                    "errorMessage",
                    "game_not_found",
                  ),
            ],
      );
    });
  });
}
