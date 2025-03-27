import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_repository/games_repository.dart' as games_repository;
import 'package:gamieden/nintendo_eshop/cubit/add_game_cubit.dart';
import 'package:gamieden/nintendo_eshop/cubit/nintendo_game_search_cubit.dart';
import 'package:gamieden/nintendo_eshop/widgets/game_found_list.dart';
import 'package:gamieden/nintendo_eshop/widgets/game_load_error.dart';
import 'package:gamieden/nintendo_eshop/widgets/game_loading.dart';
import 'package:nintendo_eshop_repository/nintendo_eshop_repository.dart';

class SearchGameList extends StatelessWidget {
  const SearchGameList({super.key, required this.nameQuery});

  final String nameQuery;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AddGameCubit(
            gamesRepository: context.read<games_repository.GamesRepository>(),
          )..setInitial(),
      child: BlocProvider(
        create:
            (context) => NintendoGameSearchCubit(
              nintendoEshopRepository: context.read<NintendoEshopRepository>(),
            )..searchGames(nameQuery),
        child: Scaffold(
          appBar: AppBar(title: Text("Search results")),
          body: Center(child: SearchGameScreen()),
        ),
      ),
    );
  }
}

class SearchGameScreen extends StatelessWidget {
  const SearchGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NintendoGameSearchCubit, NintendoGameSearchState>(
      builder: (context, state) {
        return BlocListener<AddGameCubit, AddGameState>(
          listenWhen:
              (previous, current) =>
                  previous.status != current.status &&
                  current.status == AddGameStatus.success,
          listener: (context, state) => Beamer.of(context).beamToNamed("/"),
          child: switch (state.status) {
            NintendoGameSearchStatus.initial => const Placeholder(),
            NintendoGameSearchStatus.loading => const GameLoading(),
            NintendoGameSearchStatus.failure => GameLoadError(
              text: state.errorMessage,
            ),
            NintendoGameSearchStatus.success => GameFoundList(
              games: state.games,
            ),
          },
        );
      },
    );
  }
}
