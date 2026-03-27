// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCartError _$StoreCartErrorFromJson(Map<String, dynamic> json) =>
    StoreCartError(
      code: json['code'] as String?,
      message: json['message'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StoreCartErrorToJson(StoreCartError instance) =>
    <String, dynamic>{
      'code': ?instance.code,
      'message': ?instance.message,
      'data': ?instance.data,
    };
