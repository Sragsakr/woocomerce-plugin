// @dart=3.8
import 'package:json_annotation/json_annotation.dart';

part 'store_cart_quantity_limits.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCartQuantityLimits {
  /// Minimum quantity allowed
  @JsonKey(name: 'minimum')
  int? minimum;

  /// Maximum quantity allowed
  @JsonKey(name: 'maximum')
  int? maximum;

  /// Quantity must be a multiple of this value
  @JsonKey(name: 'multiple_of')
  int? multipleOf;

  /// Whether the quantity is editable
  @JsonKey(name: 'editable')
  bool? editable;

  StoreCartQuantityLimits({
    this.minimum,
    this.maximum,
    this.multipleOf,
    this.editable,
  });

  factory StoreCartQuantityLimits.fromJson(Map<String, dynamic> json) =>
      _$StoreCartQuantityLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartQuantityLimitsToJson(this);

  static StoreCartQuantityLimits fake() => StoreCartQuantityLimits(
        minimum: 1,
        maximum: 9999,
        multipleOf: 1,
        editable: true,
      );
}

