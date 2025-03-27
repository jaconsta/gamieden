import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nintendo_eshop_repository/nintendo_eshop_repository.dart';

part "nintendo_game_search_state.dart";

class NintendoGameSearchCubit extends Cubit<NintendoGameSearchState> {
  final NintendoEshopRepository nintendoEshopRepository;

  NintendoGameSearchCubit({required this.nintendoEshopRepository})
    : super(NintendoGameSearchState());

  Future<void> searchGames(String name) async {
    if (name.isEmpty) {
      return;
    }

    emit(state.copyWith(status: NintendoGameSearchStatus.loading));

    try {
      final games = await nintendoEshopRepository.find(name);
      emit(
        state.copyWith(status: NintendoGameSearchStatus.success, games: games),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: NintendoGameSearchStatus.failure,
          errorMessage: "Could not load desired games list.",
        ),
      );
    }
  }

  void clearError() {
    emit(
      state.copyWith(
        status: NintendoGameSearchStatus.initial,
        errorMessage: "",
      ),
    );
  }
}
