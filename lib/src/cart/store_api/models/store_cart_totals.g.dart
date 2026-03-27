// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=3.8

part of 'store_cart_totals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreCartTotals _$StoreCartTotalsFromJson(Map<String, dynamic> json) =>
    StoreCartTotals(
      totalItems: json['total_items'] as String?,
      totalItemsTax: json['total_items_tax'] as String?,
      totalFees: json['total_fees'] as String?,
      totalFeesTax: json['total_fees_tax'] as String?,
      totalDiscount: json['total_discount'] as String?,
      totalDiscountTax: json['total_discount_tax'] as String?,
      totalShipping: json['total_shipping'] as String?,
      totalShippingTax: json['total_shipping_tax'] as String?,
      totalPrice: json['total_price'] as String?,
      totalTax: json['total_tax'] as String?,
      lineSubtotal: json['line_subtotal'] as String?,
      lineSubtotalTax: json['line_subtotal_tax'] as String?,
      lineTotal: json['line_total'] as String?,
      lineTotalTax: json['line_total_tax'] as String?,
      currencyCode: json['currency_code'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      currencyMinorUnit: (json['currency_minor_unit'] as num?)?.toInt(),
      currencyDecimalSeparator: json['currency_decimal_separator'] as String?,
      currencyThousandSeparator: json['currency_thousand_separator'] as String?,
      currencyPrefix: json['currency_prefix'] as String?,
      currencySuffix: json['currency_suffix'] as String?,
    );

Map<String, dynamic> _$StoreCartTotalsToJson(StoreCartTotals instance) =>
    <String, dynamic>{
      'total_items': ?instance.totalItems,
      'total_items_tax': ?instance.totalItemsTax,
      'total_fees': ?instance.totalFees,
      'total_fees_tax': ?instance.totalFeesTax,
      'total_discount': ?instance.totalDiscount,
      'total_discount_tax': ?instance.totalDiscountTax,
      'total_shipping': ?instance.totalShipping,
      'total_shipping_tax': ?instance.totalShippingTax,
      'total_price': ?instance.totalPrice,
      'total_tax': ?instance.totalTax,
      'line_subtotal': ?instance.lineSubtotal,
      'line_subtotal_tax': ?instance.lineSubtotalTax,
      'line_total': ?instance.lineTotal,
      'line_total_tax': ?instance.lineTotalTax,
      'currency_code': ?instance.currencyCode,
      'currency_symbol': ?instance.currencySymbol,
      'currency_minor_unit': ?instance.currencyMinorUnit,
      'currency_decimal_separator': ?instance.currencyDecimalSeparator,
      'currency_thousand_separator': ?instance.currencyThousandSeparator,
      'currency_prefix': ?instance.currencyPrefix,
      'currency_suffix': ?instance.currencySuffix,
    };
