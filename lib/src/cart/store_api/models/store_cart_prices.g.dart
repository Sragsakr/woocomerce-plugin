// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCartRawPrices _$StoreCartRawPricesFromJson(Map<String, dynamic> json) =>
    StoreCartRawPrices(
      precision: (json['precision'] as num?)?.toInt(),
      price: json['price'] as String?,
      regularPrice: json['regular_price'] as String?,
      salePrice: json['sale_price'] as String?,
    );

Map<String, dynamic> _$StoreCartRawPricesToJson(StoreCartRawPrices instance) =>
    <String, dynamic>{
      'precision': ?instance.precision,
      'price': ?instance.price,
      'regular_price': ?instance.regularPrice,
      'sale_price': ?instance.salePrice,
    };

StoreCartPrices _$StoreCartPricesFromJson(Map<String, dynamic> json) =>
    StoreCartPrices(
      price: json['price'] as String?,
      regularPrice: json['regular_price'] as String?,
      salePrice: json['sale_price'] as String?,
      priceRange: json['price_range'] as Map<String, dynamic>?,
      currencyCode: json['currency_code'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyMinorUnit: (json['currency_minor_unit'] as num?)?.toInt(),
      currencyDecimalSeparator: json['currency_decimal_separator'] as String?,
      currencyThousandSeparator: json['currency_thousand_separator'] as String?,
      currencyPrefix: json['currency_prefix'] as String?,
      currencySuffix: json['currency_suffix'] as String?,
      rawPrices: json['raw_prices'] == null
          ? null
          : StoreCartRawPrices.fromJson(
              json['raw_prices'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StoreCartPricesToJson(StoreCartPrices instance) =>
    <String, dynamic>{
      'price': ?instance.price,
      'regular_price': ?instance.regularPrice,
      'sale_price': ?instance.salePrice,
      'price_range': ?instance.priceRange,
      'currency_code': ?instance.currencyCode,
      'currency_symbol': ?instance.currencySymbol,
      'currency_minor_unit': ?instance.currencyMinorUnit,
      'currency_decimal_separator': ?instance.currencyDecimalSeparator,
      'currency_thousand_separator': ?instance.currencyThousandSeparator,
      'currency_prefix': ?instance.currencyPrefix,
      'currency_suffix': ?instance.currencySuffix,
      'raw_prices': ?instance.rawPrices,
    };
