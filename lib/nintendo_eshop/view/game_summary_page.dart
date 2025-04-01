import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_repository/games_repository.dart' as games_repository;
import 'package:flutter/material.dart';
import 'package:gamieden/nintendo_eshop/cubit/game_summary_cubit.dart';
import 'package:gamieden/nintendo_eshop/widgets/game_load_error.dart';
import 'package:gamieden/nintendo_eshop/widgets/game_loading.dart';
import 'package:gamieden/nintendo_eshop/widgets/game_summary_populated.dart';

class GameSummaryPage extends StatelessWidget {
  final String gameId;

  const GameSummaryPage(this.gameId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => GameSummaryCubit(
            gamesRepository: context.read<games_repository.GamesRepository>(),
          )..getGame(gameId),
      child: Scaffold(
        appBar: AppBar(title: Text("Game summary")),
        body: GameSummaryView(),
      ),
    );
  }
}

class GameSummaryView extends StatelessWidget {
  const GameSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameSummaryCubit, GameSummaryState>(
      builder: (context, state) {
        return BlocListener<GameSummaryCubit, GameSummaryState>(
          listenWhen:
              (previous, current) =>
                  previous.status != current.status &&
                  current.status == GameSumaryStatus.removed,
          listener: (context, state) => Beamer.of(context).beamToNamed("/"),
          child: switch (state.status) {
            GameSumaryStatus.initial => const GameLoading(),
            GameSumaryStatus.loading => const GameLoading(),
            GameSumaryStatus.failure => const GameLoadError(),
            GameSumaryStatus.removed => const GameLoading(),
            GameSumaryStatus.success => GameSummaryPopulated(game: state.game),
          },
        );
      },
    );
  }
}
