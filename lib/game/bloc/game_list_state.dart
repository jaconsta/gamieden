part of 'game_list_bloc.dart';

enum GameListStatus { initial, loading, success, failure }

class GameListState extends Equatable {
  final GameListStatus status;
  final List<GameApi> games;

  const GameListState({
    this.status = GameListStatus.initial,
    this.games = const [],
  });

  GameListState copyWith({GameListStatus? status, List<GameApi>? games}) {
    return GameListState(
      status: status ?? this.status,
      games: games ?? this.games,
    );
  }

  @override
  List<Object?> get props => [status, games];
}
