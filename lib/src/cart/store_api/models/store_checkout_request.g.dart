// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCheckoutUpdateRequest _$StoreCheckoutUpdateRequestFromJson(
  Map<String, dynamic> json,
) => StoreCheckoutUpdateRequest(
  additionalFields: json['additional_fields'] as Map<String, dynamic>?,
  paymentMethod: json['payment_method'] as String?,
  orderNotes: json['order_notes'] as String?,
);

Map<String, dynamic> _$StoreCheckoutUpdateRequestToJson(
  StoreCheckoutUpdateRequest instance,
) => <String, dynamic>{
  'additional_fields': ?instance.additionalFields,
  'payment_method': ?instance.paymentMethod,
  'order_notes': ?instance.orderNotes,
};

StorePaymentDataItem _$StorePaymentDataItemFromJson(
  Map<String, dynamic> json,
) => StorePaymentDataItem(key: json['key'] as String?, value: json['value']);

Map<String, dynamic> _$StorePaymentDataItemToJson(
  StorePaymentDataItem instance,
) => <String, dynamic>{'key': ?instance.key, 'value': ?instance.value};

StoreCheckoutProcessRequest _$StoreCheckoutProcessRequestFromJson(
  Map<String, dynamic> json,
) => StoreCheckoutProcessRequest(
  orderKey: json['key'] as String?,
  billingAddress: json['billing_address'] == null
      ? null
      : StoreBillingAddress.fromJson(
          json['billing_address'] as Map<String, dynamic>,
        ),
  shippingAddress: json['shipping_address'] == null
      ? null
      : StoreShippingAddress.fromJson(
          json['shipping_address'] as Map<String, dynamic>,
        ),
  customerNote: json['customer_note'] as String?,
  paymentMethod: json['payment_method'] as String?,
  paymentData: (json['payment_data'] as List<dynamic>?)
      ?.map((e) => StorePaymentDataItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  customerPassword: json['customer_password'] as String?,
  createAccount: json['create_account'] as bool?,
  extensions: json['extensions'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$StoreCheckoutProcessRequestToJson(
  StoreCheckoutProcessRequest instance,
) => <String, dynamic>{
  'key': ?instance.orderKey,
  'billing_address': ?instance.billingAddress,
  'shipping_address': ?instance.shippingAddress,
  'customer_note': ?instance.customerNote,
  'payment_method': ?instance.paymentMethod,
  'payment_data': ?instance.paymentData,
  'customer_password': ?instance.customerPassword,
  'create_account': ?instance.createAccount,
  'extensions': ?instance.extensions,
};
