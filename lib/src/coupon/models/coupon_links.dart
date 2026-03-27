// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../woocommerce_flutter_api.dart';

part 'coupon_links.g.dart';

@JsonSerializable()
class WooCouponLinks {
  /// List of self links.
  @JsonKey(name: 'self')
  final List<Map<String, dynamic>>? self;

  /// List of collection links.
  @JsonKey(name: 'collection')
  final List<Map<String, dynamic>>? collection;

  WooCouponLinks({this.self, this.collection});

  factory WooCouponLinks.fromJson(Map<String, dynamic> json) =>
      _$WooCouponLinksFromJson(json);

  Map<String, dynamic> toJson() => _$WooCouponLinksToJson(this);

  static WooCouponLinks fake() => WooCouponLinks(
    self: [
      {'href': FakeHelper.url()},
    ],
    collection: [
      {'href': FakeHelper.url()},
    ],
  );
}
