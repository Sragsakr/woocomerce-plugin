// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';
import 'store_cart_totals.dart';

part 'store_cart_coupon.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCartCoupon {
  /// Coupon code
  @JsonKey(name: 'code')
  String? code;

  /// Discount type
  @JsonKey(name: 'discount_type')
  String? discountType;

  /// Totals for this coupon
  @JsonKey(name: 'totals')
  StoreCartTotals? totals;

  StoreCartCoupon({this.code, this.discountType, this.totals});

  factory StoreCartCoupon.fromJson(Map<String, dynamic> json) =>
      _$StoreCartCouponFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartCouponToJson(this);

  static StoreCartCoupon fake() => StoreCartCoupon(
    code: 'test',
    discountType: 'percent',
    totals: StoreCartTotals.fake(),
  );
}
