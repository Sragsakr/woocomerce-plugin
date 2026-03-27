// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_checkout_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCheckoutData _$StoreCheckoutDataFromJson(Map<String, dynamic> json) =>
    StoreCheckoutData(
      orderId: (json['order_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      orderKey: json['order_key'] as String?,
      orderNumber: json['order_number'] as String?,
      customerNote: json['customer_note'] as String?,
      customerId: (json['customer_id'] as num?)?.toInt(),
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
      paymentMethod: json['payment_method'] as String?,
      paymentResult: json['payment_result'] == null
          ? null
          : StorePaymentResult.fromJson(
              json['payment_result'] as Map<String, dynamic>,
            ),
      additionalFields: json['additional_fields'] as Map<String, dynamic>?,
      extensions: json['extensions'] as Map<String, dynamic>?,
      experimentalCart: json['__experimentalCart'] == null
          ? null
          : StoreCart.fromJson(
              json['__experimentalCart'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StoreCheckoutDataToJson(StoreCheckoutData instance) =>
    <String, dynamic>{
      'order_id': ?instance.orderId,
      'status': ?instance.status,
      'order_key': ?instance.orderKey,
      'order_number': ?instance.orderNumber,
      'customer_note': ?instance.customerNote,
      'customer_id': ?instance.customerId,
      'billing_address': ?instance.billingAddress,
      'shipping_address': ?instance.shippingAddress,
      'payment_method': ?instance.paymentMethod,
      'payment_result': ?instance.paymentResult,
      'additional_fields': ?instance.additionalFields,
      'extensions': ?instance.extensions,
      '__experimentalCart': ?instance.experimentalCart,
    };
