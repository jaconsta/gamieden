import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:gamieden/steamstore/models/models.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:steamstore_repository/steamstore_repository.dart'
    show SteamstoreRepository;

part "steam_game_cubit.g.dart";
part "steam_game_state.dart";

class SteamGameCubit extends HydratedCubit<SteamGameState> {
  final SteamstoreRepository steamStoreRepository;
  SteamGameCubit(this.steamStoreRepository) : super(SteamGameState());

  Future<void> getGame(String gameId) async {
    if (gameId.isEmpty) {
      return;
    }
    if (int.tryParse(gameId) == null) {
      emit(
        state.copyWith(
          status: SteamGameStatus.failure,
          errorMessage: "gameId_not_a_number",
        ),
      );
      return;
    }

    emit(state.copyWith(status: SteamGameStatus.loading));

    try {
      final game = await steamStoreRepository.getOne(gameId);

      emit(
        state.copyWith(
          status: SteamGameStatus.success,
          game: SteamGame.fromSteamGame(game),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());

      emit(
        state.copyWith(
          status: SteamGameStatus.failure,
          errorMessage: "load_game_failed",
        ),
      );
    }
  }

  Future<void> setPrices(
    String fullPrice,
    String currentPrice,
    int discountPercent,
  ) async {
    final game = state.game.copyWith(
      fullPrice: fullPrice,
      currentPrice: currentPrice,
      discountPercent: discountPercent,
    );

    emit(state.copyWith(game: game, status: SteamGameStatus.success));
  }

  Future<void> getPrice() async {
    if (state.game.steamId.isEmpty) {
      return;
    }

    emit(state.copyWith(status: SteamGameStatus.loading));
    try {
      final games = await steamStoreRepository.getPrices([state.game.steamId]);
      final gamePrice = games[state.game.steamId];
      if (gamePrice == null) {
        emit(
          state.copyWith(
            status: SteamGameStatus.failure,
            errorMessage: "game_not_found",
          ),
        );
        return;
      }

      setPrices(
        gamePrice.fullPrice,
        gamePrice.currentPrice,
        gamePrice.discountPercent,
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(
          status: SteamGameStatus.failure,
          errorMessage: "failed_update_price",
        ),
      );
    }
  }

  void clearError() {
    emit(state.copyWith(status: SteamGameStatus.initial));
  }

  @override
  SteamGameState? fromJson(Map<String, dynamic> json) =>
      SteamGameState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SteamGameState state) => state.toJson();
}
