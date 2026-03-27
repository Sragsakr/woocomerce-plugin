// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'store_cart_item.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCartItem {
  /// Cart item key (unique identifier)
  @JsonKey(name: 'key')
  String? key;

  /// Product ID
  @JsonKey(name: 'id')
  int? id;

  /// Quantity
  @JsonKey(name: 'quantity')
  int? quantity;

  /// Quantity limits
  @JsonKey(name: 'quantity_limits')
  StoreCartQuantityLimits? quantityLimits;

  /// Product name
  @JsonKey(name: 'name')
  String? name;

  /// Short description
  @JsonKey(name: 'short_description')
  String? shortDescription;

  /// Full description
  @JsonKey(name: 'description')
  String? description;

  /// SKU
  @JsonKey(name: 'sku')
  String? sku;

  /// Low stock remaining
  @JsonKey(name: 'low_stock_remaining')
  int? lowStockRemaining;

  /// Whether backorders are allowed
  @JsonKey(name: 'backorders_allowed')
  bool? backordersAllowed;

  /// Whether to show backorder badge
  @JsonKey(name: 'show_backorder_badge')
  bool? showBackorderBadge;

  /// Whether sold individually
  @JsonKey(name: 'sold_individually')
  bool? soldIndividually;

  /// Product permalink
  @JsonKey(name: 'permalink')
  String? permalink;

  /// Product images
  @JsonKey(name: 'images')
  List<WooProductImage>? images;

  /// Variation attributes
  @JsonKey(name: 'variation')
  List<Map<String, dynamic>>? variation;

  /// Item data
  @JsonKey(name: 'item_data')
  List<Map<String, dynamic>>? itemData;

  /// Prices
  @JsonKey(name: 'prices')
  StoreCartPrices? prices;

  /// Totals
  @JsonKey(name: 'totals')
  StoreCartTotals? totals;

  /// Catalog visibility
  @JsonKey(name: 'catalog_visibility')
  String? catalogVisibility;

  /// Extensions (for plugin data)
  @JsonKey(name: 'extensions')
  Map<String, dynamic>? extensions;

  StoreCartItem({
    this.key,
    this.id,
    this.quantity,
    this.quantityLimits,
    this.name,
    this.shortDescription,
    this.description,
    this.sku,
    this.lowStockRemaining,
    this.backordersAllowed,
    this.showBackorderBadge,
    this.soldIndividually,
    this.permalink,
    this.images,
    this.variation,
    this.itemData,
    this.prices,
    this.totals,
    this.catalogVisibility,
    this.extensions,
  });

  factory StoreCartItem.fromJson(Map<String, dynamic> json) =>
      _$StoreCartItemFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartItemToJson(this);

  static StoreCartItem fake() => StoreCartItem(
    key: 'a5771bce93e200c36f7cd9dfd0e5deaa',
    id: 38,
    quantity: 1,
    quantityLimits: StoreCartQuantityLimits.fake(),
    name: 'Beanie with Logo',
    shortDescription: '<p>This is a simple product.</p>',
    description: '<p>Product description</p>',
    sku: 'Woo-beanie-logo',
    lowStockRemaining: null,
    backordersAllowed: false,
    showBackorderBadge: false,
    soldIndividually: false,
    permalink: 'https://example.com/product/beanie-with-logo/',
    images: [],
    variation: [],
    itemData: [],
    prices: StoreCartPrices.fake(),
    totals: StoreCartTotals.fake(),
    catalogVisibility: 'visible',
    extensions: {},
  );
}
