part of 'nintendo_game_search_cubit.dart';

enum NintendoGameSearchStatus { initial, loading, success, failure }

extension GameStatusX on NintendoGameSearchStatus {
  bool get isInitial => this == NintendoGameSearchStatus.initial;
  bool get isLoading => this == NintendoGameSearchStatus.loading;
  bool get isSuccess => this == NintendoGameSearchStatus.success;
  bool get isFailure => this == NintendoGameSearchStatus.failure;
}

class NintendoGameSearchState extends Equatable {
  final NintendoGameSearchStatus status;
  final List<NintendoGame> games;
  final String? errorMessage;

  NintendoGameSearchState({
    this.status = NintendoGameSearchStatus.initial,
    List<NintendoGame>? games,
    this.errorMessage,
  }) : games = games ?? [];

  NintendoGameSearchState copyWith({
    NintendoGameSearchStatus? status,
    List<NintendoGame>? games,
    String? errorMessage,
  }) => NintendoGameSearchState(
    status: status ?? this.status,
    games: games ?? this.games,
    errorMessage: errorMessage ?? this.errorMessage,
  );

  @override
  List<Object?> get props => [status, games, errorMessage];
}
