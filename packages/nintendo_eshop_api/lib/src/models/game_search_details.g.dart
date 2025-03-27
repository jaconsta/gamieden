// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'game_search_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameSearchDetails _$GameSearchDetailsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'GameSearchDetails',
      json,
      ($checkedConvert) {
        $checkKeys(json, disallowNullValues: const ['nsuid_txt']);
        final val = GameSearchDetails(
          nsuIds: $checkedConvert(
            'nsuid_txt',
            (v) =>
                (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                const [],
          ),
          fsId: $checkedConvert('fs_id', (v) => v as String),
          name: $checkedConvert('title', (v) => v as String),
          gamePath: $checkedConvert('url', (v) => v as String),
          type: $checkedConvert('pg_s', (v) => v as String),
          priceRegular: $checkedConvert(
            'price_regular_f',
            (v) => (v as num?)?.toDouble(),
          ),
          priceHasDiscount: $checkedConvert(
            'price_has_discount_b',
            (v) => v as bool?,
          ),
          priceDiscount: $checkedConvert(
            'price_discounted_f',
            (v) => (v as num?)?.toDouble(),
          ),
          discountPercent: $checkedConvert(
            'price_discount_percentage_f',
            (v) => (v as num).toDouble(),
          ),
          requiresSubscription: $checkedConvert(
            'paid_subscription_required_b',
            (v) => v as bool,
          ),
          imageCapsule: $checkedConvert(
            'wishlist_email_square_image_url_s',
            (v) => v as String,
          ),
          imageBanner: $checkedConvert(
            'wishlist_email_banner640w_image_url_s',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'nsuIds': 'nsuid_txt',
        'fsId': 'fs_id',
        'name': 'title',
        'gamePath': 'url',
        'type': 'pg_s',
        'priceRegular': 'price_regular_f',
        'priceHasDiscount': 'price_has_discount_b',
        'priceDiscount': 'price_discounted_f',
        'discountPercent': 'price_discount_percentage_f',
        'requiresSubscription': 'paid_subscription_required_b',
        'imageCapsule': 'wishlist_email_square_image_url_s',
        'imageBanner': 'wishlist_email_banner640w_image_url_s',
      },
    );
