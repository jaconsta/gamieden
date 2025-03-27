part of "steam_game_cubit.dart";

enum SteamGameStatus { initial, loading, success, failure }

extension GameStatusX on SteamGameStatus {
  bool get isInitial => this == SteamGameStatus.initial;
  bool get isLoading => this == SteamGameStatus.loading;
  bool get isSuccess => this == SteamGameStatus.success;
  bool get isFailure => this == SteamGameStatus.failure;
}

@JsonSerializable()
class SteamGameState extends Equatable {
  final SteamGameStatus status;
  final SteamGame game;
  final String? errorMessage;

  SteamGameState({
    this.status = SteamGameStatus.initial,
    SteamGame? game,
    this.errorMessage,
  }) : game = game ?? SteamGame.empty();

  SteamGameState copyWith({
    SteamGameStatus? status,
    SteamGame? game,
    String? errorMessage,
  }) {
    return SteamGameState(
      status: status ?? this.status,
      game: game ?? this.game,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory SteamGameState.fromJson(Map<String, dynamic> json) =>
      _$SteamGameStateFromJson(json);

  Map<String, dynamic> toJson() => _$SteamGameStateToJson(this);

  @override
  List<Object?> get props => [status, game, errorMessage];
}
