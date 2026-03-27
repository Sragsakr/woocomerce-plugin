// @dart=3.8
import 'package:json_annotation/json_annotation.dart';

part 'store_cart_totals.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCartTotals {
  /// Total items (cart-level)
  @JsonKey(name: 'total_items')
  String? totalItems;

  /// Total items tax (cart-level)
  @JsonKey(name: 'total_items_tax')
  String? totalItemsTax;

  /// Total fees (cart-level)
  @JsonKey(name: 'total_fees')
  String? totalFees;

  /// Total fees tax (cart-level)
  @JsonKey(name: 'total_fees_tax')
  String? totalFeesTax;

  /// Total discount (cart-level)
  @JsonKey(name: 'total_discount')
  String? totalDiscount;

  /// Total discount tax (cart-level)
  @JsonKey(name: 'total_discount_tax')
  String? totalDiscountTax;

  /// Total shipping (cart-level)
  @JsonKey(name: 'total_shipping')
  String? totalShipping;

  /// Total shipping tax (cart-level)
  @JsonKey(name: 'total_shipping_tax')
  String? totalShippingTax;

  /// Total price (cart-level)
  @JsonKey(name: 'total_price')
  String? totalPrice;

  /// Total tax (cart-level)
  @JsonKey(name: 'total_tax')
  String? totalTax;

  /// Line subtotal (item-level)
  @JsonKey(name: 'line_subtotal')
  String? lineSubtotal;

  /// Line subtotal tax (item-level)
  @JsonKey(name: 'line_subtotal_tax')
  String? lineSubtotalTax;

  /// Line total (item-level)
  @JsonKey(name: 'line_total')
  String? lineTotal;

  /// Line total tax (item-level)
  @JsonKey(name: 'line_total_tax')
  String? lineTotalTax;

  /// Currency code
  @JsonKey(name: 'currency_code')
  String? currencyCode;

  /// Currency symbol
  @JsonKey(name: 'currency_symbol')
  String? currencySymbol;

  /// Currency minor unit
  @JsonKey(name: 'currency_minor_unit')
  int? currencyMinorUnit;

  /// Currency decimal separator
  @JsonKey(name: 'currency_decimal_separator')
  String? currencyDecimalSeparator;

  /// Currency thousand separator
  @JsonKey(name: 'currency_thousand_separator')
  String? currencyThousandSeparator;

  /// Currency prefix
  @JsonKey(name: 'currency_prefix')
  String? currencyPrefix;

  /// Currency suffix
  @JsonKey(name: 'currency_suffix')
  String? currencySuffix;

  StoreCartTotals({
    this.totalItems,
    this.totalItemsTax,
    this.totalFees,
    this.totalFeesTax,
    this.totalDiscount,
    this.totalDiscountTax,
    this.totalShipping,
    this.totalShippingTax,
    this.totalPrice,
    this.totalTax,
    this.lineSubtotal,
    this.lineSubtotalTax,
    this.lineTotal,
    this.lineTotalTax,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  factory StoreCartTotals.fromJson(Map<String, dynamic> json) =>
      _$StoreCartTotalsFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartTotalsToJson(this);

  static StoreCartTotals fake() => StoreCartTotals(
        totalItems: '1800',
        totalItemsTax: '0',
        totalFees: '0',
        totalFeesTax: '0',
        totalDiscount: '270',
        totalDiscountTax: '0',
        totalShipping: '0',
        totalShippingTax: '0',
        totalPrice: '1530',
        totalTax: '0',
        lineSubtotal: '1800',
        lineSubtotalTax: '180',
        lineTotal: '1530',
        lineTotalTax: '153',
        currencyCode: 'USD',
        currencySymbol: '\$',
        currencyMinorUnit: 2,
        currencyDecimalSeparator: '.',
        currencyThousandSeparator: ',',
        currencyPrefix: '\$',
        currencySuffix: '',
      );
}

