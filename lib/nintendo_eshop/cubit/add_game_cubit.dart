import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_api/games_api.dart' as games_api;
import 'package:games_repository/games_repository.dart' as games_repository;

part "add_game_state.dart";

class AddGameCubit extends Cubit<AddGameState> {
  final games_repository.GamesRepository _gamesRepository;

  AddGameCubit({required games_repository.GamesRepository gamesRepository})
    : _gamesRepository = gamesRepository,
      super(const AddGameState());

  void setInitial() {
    emit(state.copyWith(status: AddGameStatus.initial));
  }

  Future<void> addGame(games_api.GameApi game) async {
    emit(state.copyWith(status: AddGameStatus.loading));
    try {
      await _gamesRepository.saveGame(game);
    } catch (_) {
      emit(state.copyWith(status: AddGameStatus.failure));
      return;
    }
    emit(state.copyWith(status: AddGameStatus.success));
  }
}
