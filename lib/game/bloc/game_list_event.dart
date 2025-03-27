part of "game_list_bloc.dart";

sealed class GameListEvent extends Equatable {
  const GameListEvent();

  @override
  List<Object?> get props => [];
}

final class GameListSubscriptionRequested extends GameListEvent {
  const GameListSubscriptionRequested();
}
