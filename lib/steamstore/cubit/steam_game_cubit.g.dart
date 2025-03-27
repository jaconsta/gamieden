// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steam_game_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteamGameState _$SteamGameStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SteamGameState', json, ($checkedConvert) {
      final val = SteamGameState(
        status: $checkedConvert(
          'status',
          (v) =>
              $enumDecodeNullable(_$SteamGameStatusEnumMap, v) ??
              SteamGameStatus.initial,
        ),
        game: $checkedConvert(
          'game',
          (v) =>
              v == null ? null : SteamGame.fromJson(v as Map<String, dynamic>),
        ),
        errorMessage: $checkedConvert('error_message', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'errorMessage': 'error_message'});

Map<String, dynamic> _$SteamGameStateToJson(SteamGameState instance) =>
    <String, dynamic>{
      'status': _$SteamGameStatusEnumMap[instance.status]!,
      'game': instance.game.toJson(),
      'error_message': instance.errorMessage,
    };

const _$SteamGameStatusEnumMap = {
  SteamGameStatus.initial: 'initial',
  SteamGameStatus.loading: 'loading',
  SteamGameStatus.success: 'success',
  SteamGameStatus.failure: 'failure',
};
