// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCartFee _$StoreCartFeeFromJson(Map<String, dynamic> json) => StoreCartFee(
  id: json['id'] as String?,
  name: json['name'] as String?,
  totals: json['totals'] == null
      ? null
      : StoreCartTotals.fromJson(json['totals'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StoreCartFeeToJson(StoreCartFee instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'name': ?instance.name,
      'totals': ?instance.totals,
    };
