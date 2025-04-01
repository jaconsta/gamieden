part of 'game_summary_cubit.dart';

enum GameSumaryStatus { initial, loading, success, failure, removed }

class GameSummaryState extends Equatable {
  final GameSumaryStatus status;
  final games_api.GameApi game;

  const GameSummaryState({
    this.status = GameSumaryStatus.initial,
    this.game = const games_api.EmptyGame(),
  });

  GameSummaryState copyWith({
    GameSumaryStatus? status,
    games_api.GameApi? game,
  }) =>
      GameSummaryState(status: status ?? this.status, game: game ?? this.game);

  @override
  List<Object?> get props => [status];
}
