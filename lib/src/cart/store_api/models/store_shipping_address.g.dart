// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_shipping_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreShippingAddress _$StoreShippingAddressFromJson(
  Map<String, dynamic> json,
) => StoreShippingAddress(
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  company: json['company'] as String?,
  address1: json['address_1'] as String?,
  address2: json['address_2'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  postcode: json['postcode'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$StoreShippingAddressToJson(
  StoreShippingAddress instance,
) => <String, dynamic>{
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'company': ?instance.company,
  'address_1': ?instance.address1,
  'address_2': ?instance.address2,
  'city': ?instance.city,
  'state': ?instance.state,
  'postcode': ?instance.postcode,
  'country': ?instance.country,
};
