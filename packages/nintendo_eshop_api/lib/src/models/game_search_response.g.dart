// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'game_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameSearchResponse _$GameSearchResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GameSearchResponse', json, ($checkedConvert) {
  final val = GameSearchResponse(
    numFound: $checkedConvert('numFound', (v) => (v as num).toInt()),
    start: $checkedConvert('start', (v) => (v as num).toInt()),
    numFoundExact: $checkedConvert('numFoundExact', (v) => v as bool),
    docs: $checkedConvert(
      'docs',
      (v) =>
          (v as List<dynamic>)
              .map((e) => GameSearchDetails.fromJson(e as Map<String, dynamic>))
              .toList(),
    ),
  );
  return val;
});
