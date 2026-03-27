// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart_quantity_limits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCartQuantityLimits _$StoreCartQuantityLimitsFromJson(
  Map<String, dynamic> json,
) => StoreCartQuantityLimits(
  minimum: (json['minimum'] as num?)?.toInt(),
  maximum: (json['maximum'] as num?)?.toInt(),
  multipleOf: (json['multiple_of'] as num?)?.toInt(),
  editable: json['editable'] as bool?,
);

Map<String, dynamic> _$StoreCartQuantityLimitsToJson(
  StoreCartQuantityLimits instance,
) => <String, dynamic>{
  'minimum': ?instance.minimum,
  'maximum': ?instance.maximum,
  'multiple_of': ?instance.multipleOf,
  'editable': ?instance.editable,
};
