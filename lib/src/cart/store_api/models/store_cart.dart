// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'store_cart.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCart {
  /// Cart items
  @JsonKey(name: 'items')
  List<StoreCartItem>? items;

  /// Applied coupons
  @JsonKey(name: 'coupons')
  List<StoreCartCoupon>? coupons;

  /// Fees
  @JsonKey(name: 'fees')
  List<StoreCartFee>? fees;

  /// Cart totals
  @JsonKey(name: 'totals')
  StoreCartTotals? totals;

  /// Shipping address
  @JsonKey(name: 'shipping_address')
  StoreShippingAddress? shippingAddress;

  /// Billing address
  @JsonKey(name: 'billing_address')
  StoreBillingAddress? billingAddress;

  /// Shipping rates (packages)
  @JsonKey(name: 'shipping_rates')
  List<StoreShippingPackage>? shippingRates;

  /// Items count
  @JsonKey(name: 'items_count')
  int? itemsCount;

  /// Cross-sell products
  @JsonKey(name: 'cross_sells')
  List<int>? crossSells;

  /// Whether payment is needed
  @JsonKey(name: 'needs_payment')
  bool? needsPayment;

  /// Whether shipping is needed
  @JsonKey(name: 'needs_shipping')
  bool? needsShipping;

  /// Whether shipping has been calculated
  @JsonKey(name: 'has_calculated_shipping')
  bool? hasCalculatedShipping;

  StoreCart({
    this.items,
    this.coupons,
    this.fees,
    this.totals,
    this.shippingAddress,
    this.billingAddress,
    this.shippingRates,
    this.itemsCount,
    this.crossSells,
    this.needsPayment,
    this.needsShipping,
    this.hasCalculatedShipping,
  });

  factory StoreCart.fromJson(Map<String, dynamic> json) =>
      _$StoreCartFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartToJson(this);

  static StoreCart fake() => StoreCart(
    items: [StoreCartItem.fake()],
    coupons: [StoreCartCoupon.fake()],
    fees: [StoreCartFee.fake()],
    totals: StoreCartTotals.fake(),
    shippingAddress: StoreShippingAddress.fake(),
    billingAddress: StoreBillingAddress.fake(),
    shippingRates: [StoreShippingPackage.fake()],
    itemsCount: 1,
    crossSells: [],
    needsPayment: true,
    needsShipping: true,
    hasCalculatedShipping: true,
  );
}
