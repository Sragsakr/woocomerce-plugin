// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'store_checkout_data.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCheckoutData {
  /// Order ID
  @JsonKey(name: 'order_id')
  int? orderId;

  /// Order status
  @JsonKey(name: 'status')
  String? status;

  /// Order key
  @JsonKey(name: 'order_key')
  String? orderKey;

  /// Order number
  @JsonKey(name: 'order_number')
  String? orderNumber;

  /// Customer note
  @JsonKey(name: 'customer_note')
  String? customerNote;

  /// Customer ID
  @JsonKey(name: 'customer_id')
  int? customerId;

  /// Billing address
  @JsonKey(name: 'billing_address')
  StoreBillingAddress? billingAddress;

  /// Shipping address
  @JsonKey(name: 'shipping_address')
  StoreShippingAddress? shippingAddress;

  /// Payment method
  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  /// Payment result
  @JsonKey(name: 'payment_result')
  StorePaymentResult? paymentResult;

  /// Additional fields
  @JsonKey(name: 'additional_fields')
  Map<String, dynamic>? additionalFields;

  /// Extensions
  @JsonKey(name: 'extensions')
  Map<String, dynamic>? extensions;

  /// Experimental cart (included in response but not used for totals)
  @JsonKey(name: '__experimentalCart')
  StoreCart? experimentalCart;

  StoreCheckoutData({
    this.orderId,
    this.status,
    this.orderKey,
    this.orderNumber,
    this.customerNote,
    this.customerId,
    this.billingAddress,
    this.shippingAddress,
    this.paymentMethod,
    this.paymentResult,
    this.additionalFields,
    this.extensions,
    this.experimentalCart,
  });

  factory StoreCheckoutData.fromJson(Map<String, dynamic> json) =>
      _$StoreCheckoutDataFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCheckoutDataToJson(this);

  static StoreCheckoutData fake() => StoreCheckoutData(
    orderId: 146,
    status: 'checkout-draft',
    orderKey: 'wc_order_VPffqyvgWVqWL',
    orderNumber: '146',
    customerNote: '',
    customerId: 1,
    billingAddress: StoreBillingAddress.fake(),
    shippingAddress: StoreShippingAddress.fake(),
    paymentMethod: '',
    paymentResult: null,
    additionalFields: {},
    extensions: {},
    experimentalCart: StoreCart.fake(),
  );
}
