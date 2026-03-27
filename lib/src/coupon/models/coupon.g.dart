// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WooCoupon _$WooCouponFromJson(Map<String, dynamic> json) => WooCoupon(
  id: (json['id'] as num?)?.toInt(),
  code: json['code'] as String?,
  amount: json['amount'] as String?,
  status: WooCouponStatus.fromString(json['status'] as String),
  dateCreated: json['date_created'] == null
      ? null
      : DateTime.parse(json['date_created'] as String),
  dateCreatedGmt: json['date_created_gmt'] == null
      ? null
      : DateTime.parse(json['date_created_gmt'] as String),
  dateModified: json['date_modified'] == null
      ? null
      : DateTime.parse(json['date_modified'] as String),
  dateModifiedGmt: json['date_modified_gmt'] == null
      ? null
      : DateTime.parse(json['date_modified_gmt'] as String),
  discountType: WooCouponDiscountType.fromString(
    json['discount_type'] as String,
  ),
  description: json['description'] as String?,
  dateExpires: json['date_expires'] == null
      ? null
      : DateTime.parse(json['date_expires'] as String),
  dateExpiresGmt: json['date_expires_gmt'] == null
      ? null
      : DateTime.parse(json['date_expires_gmt'] as String),
  usageCount: (json['usage_count'] as num?)?.toInt(),
  individualUse: json['individual_use'] as bool?,
  productIds: (json['product_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  excludedProductIds: (json['excluded_product_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  usageLimit: (json['usage_limit'] as num?)?.toInt(),
  usageLimitPerUser: (json['usage_limit_per_user'] as num?)?.toInt(),
  limitUsageToXItems: (json['limit_usage_to_x_items'] as num?)?.toInt(),
  freeShipping: json['free_shipping'] as bool?,
  productCategories: (json['product_categories'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  excludedProductCategories:
      (json['excluded_product_categories'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
  excludeSaleItems: json['exclude_sale_items'] as bool?,
  minimumAmount: json['minimum_amount'] as String?,
  maximumAmount: json['maximum_amount'] as String?,
  emailRestrictions: (json['email_restrictions'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  usedBy: (json['used_by'] as List<dynamic>?)?.map((e) => e as String).toList(),
  metaData: (json['meta_data'] as List<dynamic>?)
      ?.map((e) => WooMetaData.fromJson(e as Map<String, dynamic>))
      .toList(),
  links: json['_links'] == null
      ? null
      : WooCouponLinks.fromJson(json['_links'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WooCouponToJson(WooCoupon instance) => <String, dynamic>{
  'id': ?instance.id,
  'code': ?instance.code,
  'amount': ?instance.amount,
  'status': WooCouponStatus.toValue(instance.status),
  'date_created': instance.dateCreated?.toIso8601String(),
  'date_created_gmt': instance.dateCreatedGmt?.toIso8601String(),
  'date_modified': instance.dateModified?.toIso8601String(),
  'date_modified_gmt': instance.dateModifiedGmt?.toIso8601String(),
  'discount_type': WooCouponDiscountType.toValue(instance.discountType),
  'description': ?instance.description,
  'date_expires': instance.dateExpires?.toIso8601String(),
  'date_expires_gmt': instance.dateExpiresGmt?.toIso8601String(),
  'usage_count': instance.usageCount,
  'individual_use': instance.individualUse,
  'product_ids': instance.productIds,
  'excluded_product_ids': instance.excludedProductIds,
  'usage_limit': instance.usageLimit,
  'usage_limit_per_user': instance.usageLimitPerUser,
  'limit_usage_to_x_items': instance.limitUsageToXItems,
  'free_shipping': instance.freeShipping,
  'product_categories': instance.productCategories,
  'excluded_product_categories': instance.excludedProductCategories,
  'exclude_sale_items': instance.excludeSaleItems,
  'minimum_amount': instance.minimumAmount,
  'maximum_amount': instance.maximumAmount,
  'email_restrictions': instance.emailRestrictions,
  'used_by': instance.usedBy,
  'meta_data': instance.metaData,
  '_links': instance.links,
};
