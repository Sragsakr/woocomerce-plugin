// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_payment_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StorePaymentResult _$StorePaymentResultFromJson(Map<String, dynamic> json) =>
    StorePaymentResult(
      paymentStatus: json['payment_status'] as String?,
      paymentDetails: (json['payment_details'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      redirectUrl: json['redirect_url'] as String?,
    );

Map<String, dynamic> _$StorePaymentResultToJson(StorePaymentResult instance) =>
    <String, dynamic>{
      'payment_status': ?instance.paymentStatus,
      'payment_details': ?instance.paymentDetails,
      'redirect_url': ?instance.redirectUrl,
    };
