// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_shipping_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreShippingRate _$StoreShippingRateFromJson(Map<String, dynamic> json) =>
    StoreShippingRate(
      rateId: json['rate_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      deliveryTime: json['delivery_time'] as String?,
      price: json['price'] as String?,
      taxes: json['taxes'] as String?,
      instanceId: (json['instance_id'] as num?)?.toInt(),
      methodId: json['method_id'] as String?,
      selected: json['selected'] as bool?,
    );

Map<String, dynamic> _$StoreShippingRateToJson(StoreShippingRate instance) =>
    <String, dynamic>{
      'rate_id': ?instance.rateId,
      'name': ?instance.name,
      'description': ?instance.description,
      'delivery_time': ?instance.deliveryTime,
      'price': ?instance.price,
      'taxes': ?instance.taxes,
      'instance_id': ?instance.instanceId,
      'method_id': ?instance.methodId,
      'selected': ?instance.selected,
    };

StoreShippingPackage _$StoreShippingPackageFromJson(
  Map<String, dynamic> json,
) => StoreShippingPackage(
  packageId: (json['package_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  destination: json['destination'] as Map<String, dynamic>?,
  shippingRates: (json['shipping_rates'] as List<dynamic>?)
      ?.map((e) => StoreShippingRate.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StoreShippingPackageToJson(
  StoreShippingPackage instance,
) => <String, dynamic>{
  'package_id': ?instance.packageId,
  'name': ?instance.name,
  'destination': ?instance.destination,
  'shipping_rates': ?instance.shippingRates,
};
