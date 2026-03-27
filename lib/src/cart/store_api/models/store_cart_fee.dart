// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';
import 'store_cart_totals.dart';

part 'store_cart_fee.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCartFee {
  /// Fee ID
  @JsonKey(name: 'id')
  String? id;

  /// Fee name
  @JsonKey(name: 'name')
  String? name;

  /// Totals for this fee
  @JsonKey(name: 'totals')
  StoreCartTotals? totals;

  StoreCartFee({this.id, this.name, this.totals});

  factory StoreCartFee.fromJson(Map<String, dynamic> json) =>
      _$StoreCartFeeFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartFeeToJson(this);

  static StoreCartFee fake() => StoreCartFee(
    id: 'fee-1',
    name: 'Processing Fee',
    totals: StoreCartTotals.fake(),
  );
}
