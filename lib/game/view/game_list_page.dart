import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamieden/game/bloc/game_list_bloc.dart';
import 'package:games_repository/games_repository.dart' as games_repository;
import 'package:gamieden/game/repository/game_prices_repository.dart';
import 'package:gamieden/game/widgets/game_block.dart';
import 'package:nintendo_eshop_repository/nintendo_eshop_repository.dart';
import 'package:steamstore_repository/steamstore_repository.dart';

class GameListPage extends StatelessWidget {
  const GameListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => GameListBloc(
            gamesRepository: context.read<games_repository.GamesRepository>(),
          )..add(const GameListSubscriptionRequested()),
      child: BlocListener<GameListBloc, GameListState>(
        listenWhen:
            (previous, current) =>
                previous.status != current.status &&
                current.status == GameListStatus.success,
        listener:
            (context, state) => GamePricesRepository(
              gamesRepository: context.read<games_repository.GamesRepository>(),
              steamStoreRepository: context.read<SteamstoreRepository>(),
              nintendoEshopRepository: context.read<NintendoEshopRepository>(),
            ).updatePrices(state.games),
        child: const GameListPageView(),
      ),
    );
  }
}

class GameListPageView extends StatelessWidget {
  const GameListPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Gamieden"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Add a game", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 14.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 25.0,
                children: [
                  FilledButton(
                    onPressed: () {
                      Beamer.of(context).beamToNamed("/steamstore/add");
                    },
                    child: Text(
                      "Steam",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      Beamer.of(context).beamToNamed("/nintendo/add");
                    },
                    child: Text(
                      "Nintendo",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.0),
              Expanded(child: GamesInWishlist()),
            ],
          ),
        ),
      ),
    );
  }
}

class GamesInWishlist extends StatelessWidget {
  const GamesInWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameListBloc, GameListState>(
      builder: (context, state) {
        if (state.status == GameListStatus.loading ||
            state.status == GameListStatus.initial) {
          return Center(child: Text("Loading games 🐿🏗"));
        }

        if (state.status != GameListStatus.success) {
          return Center(child: Text("Could not load your games 🦔🗑"));
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: state.games.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return GridTile(
              child: GameBlock(
                backgroundColor: Colors.green,
                text: state.games[index].summary.name,
                game: state.games[index],
              ),
            );
          },
        );
      },
    );
  }
}
