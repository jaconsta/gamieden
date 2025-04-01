import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:local_storage_games_api/local_storage_games_api.dart';
import 'package:nintendo_eshop_repository/nintendo_eshop_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:games_api/games_api.dart' as games_api;
import 'package:games_repository/games_repository.dart' as games_repository;
import 'package:gamieden/routes.dart' as router;
import 'package:gamieden/steamstore/cubit/steam_game_cubit.dart';
import 'package:gamieden/theme/theme.dart';

import 'package:steamstore_repository/steamstore_repository.dart'
    as steam_repository;
import 'package:nintendo_eshop_repository/nintendo_eshop_repository.dart'
    as nintendo_repository;

class GameApiFactory implements games_api.GameFactory {
  @override
  games_api.GameApi fromJson(games_api.JsonMap json) {
    if (json.containsKey("nintendoId")) {
      return nintendo_repository.NintendoGame.fromJson(json);
    }
    return steam_repository.SteamGame.fromJson(json);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final gamesApi = LocalStorageGameApi(
    plugin: await SharedPreferences.getInstance(),
    gameFactory: GameApiFactory(),
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  final steamStoreRepository = steam_repository.SteamstoreRepository();
  final nintendoEshopRepository = NintendoEshopRepository();

  runApp(
    App(
      steamStoreRepository: steamStoreRepository,
      nintendoEshopRepository: nintendoEshopRepository,
      createGamesRepository:
          () => games_repository.GamesRepository(gamesApi: gamesApi),
    ),
  );
}

class App extends StatelessWidget {
  final games_repository.GamesRepository Function() createGamesRepository;
  final steam_repository.SteamstoreRepository _steamStoreRepository;
  final NintendoEshopRepository _nintendoEshopRepository;
  const App({
    super.key,
    required steam_repository.SteamstoreRepository steamStoreRepository,
    required NintendoEshopRepository nintendoEshopRepository,
    required this.createGamesRepository,
  }) : _steamStoreRepository = steamStoreRepository,
       _nintendoEshopRepository = nintendoEshopRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<games_repository.GamesRepository>(
          create: (_) => createGamesRepository(),
        ),
        RepositoryProvider(create: (_) => _nintendoEshopRepository),
        RepositoryProvider(create: (_) => _steamStoreRepository),
      ],
      child: BlocProvider(
        create: (_) => SteamGameCubit(_steamStoreRepository),
        child: GamiedenApp(),
      ),
    );
  }
}

class GamiedenApp extends StatelessWidget {
  const GamiedenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gamieden, wishlist your games',
      theme: themeData,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routeInformationParser: router.routerParser,
      routerDelegate: router.routerDelegate,
      backButtonDispatcher: router.backButtonDispatcher,
    );
  }
}
