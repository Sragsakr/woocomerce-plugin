// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCartItem _$StoreCartItemFromJson(Map<String, dynamic> json) =>
    StoreCartItem(
      key: json['key'] as String?,
      id: (json['id'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      quantityLimits: json['quantity_limits'] == null
          ? null
          : StoreCartQuantityLimits.fromJson(
              json['quantity_limits'] as Map<String, dynamic>,
            ),
      name: json['name'] as String?,
      shortDescription: json['short_description'] as String?,
      description: json['description'] as String?,
      sku: json['sku'] as String?,
      lowStockRemaining: (json['low_stock_remaining'] as num?)?.toInt(),
      backordersAllowed: json['backorders_allowed'] as bool?,
      showBackorderBadge: json['show_backorder_badge'] as bool?,
      soldIndividually: json['sold_individually'] as bool?,
      permalink: json['permalink'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => WooProductImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      variation: (json['variation'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      itemData: (json['item_data'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      prices: json['prices'] == null
          ? null
          : StoreCartPrices.fromJson(json['prices'] as Map<String, dynamic>),
      totals: json['totals'] == null
          ? null
          : StoreCartTotals.fromJson(json['totals'] as Map<String, dynamic>),
      catalogVisibility: json['catalog_visibility'] as String?,
      extensions: json['extensions'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StoreCartItemToJson(StoreCartItem instance) =>
    <String, dynamic>{
      'key': ?instance.key,
      'id': ?instance.id,
      'quantity': ?instance.quantity,
      'quantity_limits': ?instance.quantityLimits,
      'name': ?instance.name,
      'short_description': ?instance.shortDescription,
      'description': ?instance.description,
      'sku': ?instance.sku,
      'low_stock_remaining': ?instance.lowStockRemaining,
      'backorders_allowed': ?instance.backordersAllowed,
      'show_backorder_badge': ?instance.showBackorderBadge,
      'sold_individually': ?instance.soldIndividually,
      'permalink': ?instance.permalink,
      'images': ?instance.images,
      'variation': ?instance.variation,
      'item_data': ?instance.itemData,
      'prices': ?instance.prices,
      'totals': ?instance.totals,
      'catalog_visibility': ?instance.catalogVisibility,
      'extensions': ?instance.extensions,
    };
