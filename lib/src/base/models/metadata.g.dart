// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WooMetaData _$WooMetaDataFromJson(Map<String, dynamic> json) => WooMetaData(
  id: (json['id'] as num?)?.toInt(),
  key: json['key'] as String?,
  value: json['value'],
);

Map<String, dynamic> _$WooMetaDataToJson(WooMetaData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'value': instance.value,
    };
