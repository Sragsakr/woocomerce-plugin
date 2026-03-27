// @dart=3.8
import 'package:json_annotation/json_annotation.dart';

part 'store_cart_prices.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCartRawPrices {
  /// Precision for price calculations
  @JsonKey(name: 'precision')
  int? precision;

  /// Price in raw format (minor units)
  @JsonKey(name: 'price')
  String? price;

  /// Regular price in raw format
  @JsonKey(name: 'regular_price')
  String? regularPrice;

  /// Sale price in raw format
  @JsonKey(name: 'sale_price')
  String? salePrice;

  StoreCartRawPrices({
    this.precision,
    this.price,
    this.regularPrice,
    this.salePrice,
  });

  factory StoreCartRawPrices.fromJson(Map<String, dynamic> json) =>
      _$StoreCartRawPricesFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartRawPricesToJson(this);

  static StoreCartRawPrices fake() => StoreCartRawPrices(
    precision: 6,
    price: '18000000',
    regularPrice: '20000000',
    salePrice: '18000000',
  );
}

@JsonSerializable(includeIfNull: false)
class StoreCartPrices {
  /// Current price
  @JsonKey(name: 'price')
  String? price;

  /// Regular price
  @JsonKey(name: 'regular_price')
  String? regularPrice;

  /// Sale price
  @JsonKey(name: 'sale_price')
  String? salePrice;

  /// Price range (for variable products)
  @JsonKey(name: 'price_range')
  Map<String, dynamic>? priceRange;

  /// Currency code (e.g., USD)
  @JsonKey(name: 'currency_code')
  String? currencyCode;

  /// Currency symbol (e.g., $)
  @JsonKey(name: 'currency_symbol')
  String? currencySymbol;

  /// Currency minor unit (decimal places)
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

  /// Raw prices with precision
  @JsonKey(name: 'raw_prices')
  StoreCartRawPrices? rawPrices;

  StoreCartPrices({
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceRange,
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
    this.rawPrices,
  });

  factory StoreCartPrices.fromJson(Map<String, dynamic> json) =>
      _$StoreCartPricesFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartPricesToJson(this);

  static StoreCartPrices fake() => StoreCartPrices(
    price: '1800',
    regularPrice: '2000',
    salePrice: '1800',
    priceRange: null,
    currencyCode: 'USD',
    currencySymbol: '\$',
    currencyMinorUnit: 2,
    currencyDecimalSeparator: '.',
    currencyThousandSeparator: ',',
    currencyPrefix: '\$',
    currencySuffix: '',
    rawPrices: StoreCartRawPrices.fake(),
  );
}
