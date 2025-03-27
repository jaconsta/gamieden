part of "add_game_cubit.dart";

enum AddGameStatus { initial, loading, success, failure }

final class AddGameState extends Equatable {
  final AddGameStatus status;

  const AddGameState({this.status = AddGameStatus.initial});

  AddGameState copyWith({AddGameStatus? status}) {
    return AddGameState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
