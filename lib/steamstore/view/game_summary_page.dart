import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamieden/steamstore/cubit/add_game_cubit.dart';

import 'package:games_repository/games_repository.dart' as games_repository;
import 'package:gamieden/steamstore/cubit/steam_game_cubit.dart';
import 'package:gamieden/steamstore/widgets/game_load_error.dart';
import 'package:gamieden/steamstore/widgets/game_loading.dart';
import 'package:gamieden/steamstore/widgets/game_populated.dart';

class GameSummaryPage extends StatelessWidget {
  final String gameId;
  const GameSummaryPage(this.gameId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => AddGameCubit(
            gamesRepository: context.read<games_repository.GamesRepository>(),
          )..setInitial(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Game summary"),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     debugPrint("should trigger bloc add to list");
            //   },
            //   icon: const Icon(Icons.check),
            //   tooltip: "Add to my list",
            // ),
          ],
        ),
        body: BlocBuilder<SteamGameCubit, SteamGameState>(
          builder: (context, state) {
            if (state.status == SteamGameStatus.initial ||
                state.game.steamId != gameId) {
              context.read<SteamGameCubit>().getGame(gameId);
            }
            return BlocListener<AddGameCubit, AddGameState>(
              listenWhen:
                  (previous, current) =>
                      previous.status != current.status &&
                      (current.status == AddGameStatus.success ||
                          current.status == AddGameStatus.removed),
              listener: (context, state) => Beamer.of(context).beamToNamed("/"),
              child: switch (state.status) {
                SteamGameStatus.initial => const Placeholder(),
                SteamGameStatus.loading => const GameLoading(),
                SteamGameStatus.failure => const GameLoadError(),
                SteamGameStatus.success => GamePopulated(
                  game: state.game,
                  onRefresh: () {
                    return context.read<SteamGameCubit>().getPrice();
                  },
                ),
              },
            );
          },
        ),
      ),
    );
  }
}
