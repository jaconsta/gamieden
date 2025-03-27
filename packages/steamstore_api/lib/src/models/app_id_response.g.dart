// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'app_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppIdResponse _$AppIdResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AppIdResponse', json, ($checkedConvert) {
      final val = AppIdResponse(
        success: $checkedConvert('success', (v) => v as bool),
        data: $checkedConvert(
          'data',
          (v) =>
              v == null ? null : AppDetails.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });
