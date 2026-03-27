// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart_coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCartCoupon _$StoreCartCouponFromJson(Map<String, dynamic> json) =>
    StoreCartCoupon(
      code: json['code'] as String?,
      discountType: json['discount_type'] as String?,
      totals: json['totals'] == null
          ? null
          : StoreCartTotals.fromJson(json['totals'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreCartCouponToJson(StoreCartCoupon instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'discount_type': ?instance.discountType,
      'totals': ?instance.totals,
    };
