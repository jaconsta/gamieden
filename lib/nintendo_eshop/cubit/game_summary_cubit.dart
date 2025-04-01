import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_api/games_api.dart' as games_api;
import 'package:games_repository/games_repository.dart' as games_repository;

part 'game_summary_state.dart';

class GameSummaryCubit extends Cubit<GameSummaryState> {
  final games_repository.GamesRepository _gamesRepository;

  GameSummaryCubit({required games_repository.GamesRepository gamesRepository})
    : _gamesRepository = gamesRepository,
      super(GameSummaryState());

  Future<void> getGame(String gameId) async {
    emit(state.copyWith(status: GameSumaryStatus.loading));

    final games = await (_gamesRepository.getGames()).first;
    try {
      final game = games.firstWhere(
        (game) =>
            game.source == games_api.GameSource.nintendo &&
            game.sourceId == gameId,
      );

      emit(state.copyWith(status: GameSumaryStatus.success, game: game));
    } catch (e) {
      emit(state.copyWith(status: GameSumaryStatus.failure));
    }
    return;
  }

  Future<void> deleteGame() async {
    await _gamesRepository.deleteGame(state.game);

    emit(
      state.copyWith(
        status: GameSumaryStatus.removed,
        game: games_api.EmptyGame(),
      ),
    );
  }
}
