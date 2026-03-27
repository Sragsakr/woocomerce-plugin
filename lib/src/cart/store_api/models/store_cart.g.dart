// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCart _$StoreCartFromJson(Map<String, dynamic> json) => StoreCart(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => StoreCartItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  coupons: (json['coupons'] as List<dynamic>?)
      ?.map((e) => StoreCartCoupon.fromJson(e as Map<String, dynamic>))
      .toList(),
  fees: (json['fees'] as List<dynamic>?)
      ?.map((e) => StoreCartFee.fromJson(e as Map<String, dynamic>))
      .toList(),
  totals: json['totals'] == null
      ? null
      : StoreCartTotals.fromJson(json['totals'] as Map<String, dynamic>),
  shippingAddress: json['shipping_address'] == null
      ? null
      : StoreShippingAddress.fromJson(
          json['shipping_address'] as Map<String, dynamic>,
        ),
  billingAddress: json['billing_address'] == null
      ? null
      : StoreBillingAddress.fromJson(
          json['billing_address'] as Map<String, dynamic>,
        ),
  shippingRates: (json['shipping_rates'] as List<dynamic>?)
      ?.map((e) => StoreShippingPackage.fromJson(e as Map<String, dynamic>))
      .toList(),
  itemsCount: (json['items_count'] as num?)?.toInt(),
  crossSells: (json['cross_sells'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  needsPayment: json['needs_payment'] as bool?,
  needsShipping: json['needs_shipping'] as bool?,
  hasCalculatedShipping: json['has_calculated_shipping'] as bool?,
);

Map<String, dynamic> _$StoreCartToJson(StoreCart instance) => <String, dynamic>{
  'items': ?instance.items,
  'coupons': ?instance.coupons,
  'fees': ?instance.fees,
  'totals': ?instance.totals,
  'shipping_address': ?instance.shippingAddress,
  'billing_address': ?instance.billingAddress,
  'shipping_rates': ?instance.shippingRates,
  'items_count': ?instance.itemsCount,
  'cross_sells': ?instance.crossSells,
  'needs_payment': ?instance.needsPayment,
  'needs_shipping': ?instance.needsShipping,
  'has_calculated_shipping': ?instance.hasCalculatedShipping,
};
