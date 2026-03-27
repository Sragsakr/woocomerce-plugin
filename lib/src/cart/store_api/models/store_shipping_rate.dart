// @dart=3.8
import 'package:json_annotation/json_annotation.dart';

part 'store_shipping_rate.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreShippingRate {
  /// Shipping rate ID
  @JsonKey(name: 'rate_id')
  String? rateId;

  /// Shipping rate name
  @JsonKey(name: 'name')
  String? name;

  /// Shipping rate description
  @JsonKey(name: 'description')
  String? description;

  /// Shipping rate delivery time
  @JsonKey(name: 'delivery_time')
  String? deliveryTime;

  /// Shipping rate price
  @JsonKey(name: 'price')
  String? price;

  /// Shipping rate taxes
  @JsonKey(name: 'taxes')
  String? taxes;

  /// Shipping rate instance ID
  @JsonKey(name: 'instance_id')
  int? instanceId;

  /// Shipping method ID
  @JsonKey(name: 'method_id')
  String? methodId;

  /// Whether this rate is selected
  @JsonKey(name: 'selected')
  bool? selected;

  StoreShippingRate({
    this.rateId,
    this.name,
    this.description,
    this.deliveryTime,
    this.price,
    this.taxes,
    this.instanceId,
    this.methodId,
    this.selected,
  });

  factory StoreShippingRate.fromJson(Map<String, dynamic> json) =>
      _$StoreShippingRateFromJson(json);

  Map<String, dynamic> toJson() => _$StoreShippingRateToJson(this);

  static StoreShippingRate fake() => StoreShippingRate(
    rateId: 'flat_rate:1',
    name: 'Flat Rate',
    description: 'Flat rate shipping',
    deliveryTime: '1-2 days',
    price: '10.00',
    taxes: '0.00',
    instanceId: 1,
    methodId: 'flat_rate',
    selected: false,
  );
}

@JsonSerializable(includeIfNull: false)
class StoreShippingPackage {
  /// Package ID
  @JsonKey(name: 'package_id')
  int? packageId;

  /// Package name
  @JsonKey(name: 'name')
  String? name;

  /// Shipping destination
  @JsonKey(name: 'destination')
  Map<String, dynamic>? destination;

  /// Available shipping rates
  @JsonKey(name: 'shipping_rates')
  List<StoreShippingRate>? shippingRates;

  StoreShippingPackage({
    this.packageId,
    this.name,
    this.destination,
    this.shippingRates,
  });

  factory StoreShippingPackage.fromJson(Map<String, dynamic> json) =>
      _$StoreShippingPackageFromJson(json);

  Map<String, dynamic> toJson() => _$StoreShippingPackageToJson(this);

  static StoreShippingPackage fake() => StoreShippingPackage(
    packageId: 1,
    name: 'Package 1',
    destination: {},
    shippingRates: [StoreShippingRate.fake()],
  );
}
