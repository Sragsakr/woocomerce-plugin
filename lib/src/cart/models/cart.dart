// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../woocommerce_flutter_api.dart';

part 'cart.g.dart';

@JsonSerializable()
class WooCart {
  /// Count of items in cart.
  @JsonKey(name: 'item_count')
  int? itemsCount;

  /// Cart Items.
  @JsonKey(name: 'items')
  List<WooCartItem>? items;

  /// If the cart needs shipping.
  @JsonKey(name: 'needs_shipping')
  bool? needsShipping;

  /// If the cart needs payment.
  @JsonKey(name: 'needs_payment')
  bool? needsPayment;

  /// Cart total price.
  @JsonKey(name: 'total_price')
  double? totalPrice;

  WooCart({
    this.itemsCount,
    this.items,
    this.needsShipping,
    this.needsPayment,
    this.totalPrice,
  });

  factory WooCart.fromJson(Map<String, dynamic> json) =>
      _$WooCartFromJson(json);

  Map<String, dynamic> toJson() => _$WooCartToJson(this);

  static WooCart fake() => WooCart(
    itemsCount: FakeHelper.integer(),
    items: List.generate(3, (index) => WooCartItem.fake()),
    needsShipping: FakeHelper.boolean(),
    needsPayment: FakeHelper.boolean(),
    totalPrice: FakeHelper.decimal(),
  );
}
