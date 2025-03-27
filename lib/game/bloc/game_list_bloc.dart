import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_api/games_api.dart';
import 'package:games_repository/games_repository.dart' as games_repository;

part "game_list_state.dart";
part "game_list_event.dart";

class GameListBloc extends Bloc<GameListEvent, GameListState> {
  final games_repository.GamesRepository _gamesRepository;

  GameListBloc({required games_repository.GamesRepository gamesRepository})
    : _gamesRepository = gamesRepository,
      super(const GameListState()) {
    on<GameListSubscriptionRequested>(_onGameListSubscriptionRequested);
  }

  Future<void> _onGameListSubscriptionRequested(
    GameListSubscriptionRequested event,
    Emitter<GameListState> emit,
  ) async {
    emit(state.copyWith(status: GameListStatus.loading));

    await emit.forEach<List<GameApi>>(
      _gamesRepository.getGames(),
      onData:
          (games) =>
              state.copyWith(status: GameListStatus.success, games: games),
      onError: (_, __) => state.copyWith(status: GameListStatus.failure),
    );
  }
}
