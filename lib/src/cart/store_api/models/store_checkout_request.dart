// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'store_checkout_request.g.dart';

/// Request model for updating checkout data (PUT /checkout)
@JsonSerializable(includeIfNull: false)
class StoreCheckoutUpdateRequest {
  /// Additional fields
  @JsonKey(name: 'additional_fields')
  Map<String, dynamic>? additionalFields;

  /// Payment method
  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  /// Order notes
  @JsonKey(name: 'order_notes')
  String? orderNotes;

  StoreCheckoutUpdateRequest({
    this.additionalFields,
    this.paymentMethod,
    this.orderNotes,
  });

  factory StoreCheckoutUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$StoreCheckoutUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCheckoutUpdateRequestToJson(this);
}

/// Payment data item for process checkout request
@JsonSerializable(includeIfNull: false)
class StorePaymentDataItem {
  /// Key
  @JsonKey(name: 'key')
  String? key;

  /// Value
  @JsonKey(name: 'value')
  dynamic value;

  StorePaymentDataItem({this.key, this.value});

  factory StorePaymentDataItem.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$StorePaymentDataItemToJson(this);
}

/// Request model for processing checkout (POST /checkout)
@JsonSerializable(includeIfNull: false)
class StoreCheckoutProcessRequest {
  /// Billing address
  @JsonKey(name: 'key')
  String? orderKey;

  /// Billing address
  @JsonKey(name: 'billing_address')
  StoreBillingAddress? billingAddress;

  /// Shipping address
  @JsonKey(name: 'shipping_address')
  StoreShippingAddress? shippingAddress;

  /// Customer note
  @JsonKey(name: 'customer_note')
  String? customerNote;

  /// Payment method
  @JsonKey(name: 'payment_method')
  String? paymentMethod;

  /// Payment data
  @JsonKey(name: 'payment_data')
  List<StorePaymentDataItem>? paymentData;

  /// Customer password (for new accounts)
  @JsonKey(name: 'customer_password')
  String? customerPassword;

  /// Create account
  @JsonKey(name: 'create_account')
  bool? createAccount;

  /// Extensions
  @JsonKey(name: 'extensions')
  Map<String, dynamic>? extensions;

  StoreCheckoutProcessRequest({
    this.orderKey,
    this.billingAddress,
    this.shippingAddress,
    this.customerNote,
    this.paymentMethod,
    this.paymentData,
    this.customerPassword,
    this.createAccount,
    this.extensions,
  });

  factory StoreCheckoutProcessRequest.fromJson(Map<String, dynamic> json) =>
      _$StoreCheckoutProcessRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCheckoutProcessRequestToJson(this);
}
