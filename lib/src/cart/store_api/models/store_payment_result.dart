// @dart=3.8
import 'package:json_annotation/json_annotation.dart';

part 'store_payment_result.g.dart';

@JsonSerializable(includeIfNull: false)
class StorePaymentResult {
  /// Payment status (e.g., "success", "pending", "failed")
  @JsonKey(name: 'payment_status')
  String? paymentStatus;

  /// Payment details (array of key-value pairs)
  @JsonKey(name: 'payment_details')
  List<Map<String, dynamic>>? paymentDetails;

  /// Redirect URL after payment
  @JsonKey(name: 'redirect_url')
  String? redirectUrl;

  StorePaymentResult({
    this.paymentStatus,
    this.paymentDetails,
    this.redirectUrl,
  });

  factory StorePaymentResult.fromJson(Map<String, dynamic> json) =>
      _$StorePaymentResultFromJson(json);

  Map<String, dynamic> toJson() => _$StorePaymentResultToJson(this);

  static StorePaymentResult fake() => StorePaymentResult(
    paymentStatus: 'success',
    paymentDetails: [
      {'key': 'transaction_id', 'value': '12345'},
    ],
    redirectUrl: 'https://example.com/order-received/146/?key=wc_order_123',
  );
}
