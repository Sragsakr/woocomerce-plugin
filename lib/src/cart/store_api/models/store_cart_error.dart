// @dart=3.8
import 'package:json_annotation/json_annotation.dart';

part 'store_cart_error.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreCartError {
  /// Error code
  @JsonKey(name: 'code')
  String? code;

  /// Error message
  @JsonKey(name: 'message')
  String? message;

  /// Error data
  @JsonKey(name: 'data')
  Map<String, dynamic>? data;

  StoreCartError({
    this.code,
    this.message,
    this.data,
  });

  factory StoreCartError.fromJson(Map<String, dynamic> json) =>
      _$StoreCartErrorFromJson(json);

  Map<String, dynamic> toJson() => _$StoreCartErrorToJson(this);
}

