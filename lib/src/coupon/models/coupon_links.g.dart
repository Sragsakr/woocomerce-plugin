// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'coupon_links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WooCouponLinks _$WooCouponLinksFromJson(Map<String, dynamic> json) =>
    WooCouponLinks(
      self: (json['self'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      collection: (json['collection'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$WooCouponLinksToJson(WooCouponLinks instance) =>
    <String, dynamic>{'self': instance.self, 'collection': instance.collection};
