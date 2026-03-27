import '../../../woocommerce_flutter_api.dart';

class WooOrderCouponLine {
  /// Item ID.
  int? id;

  /// Coupon code.
  String? code;

  /// Discount total.
  double? discount;

  /// Discount total tax.
  double? discountTax;

  /// Meta data.
  List<WooMetaData> metaData;

  WooOrderCouponLine({
    this.id,
    this.code,
    this.discount,
    this.discountTax,
    this.metaData = const [],
  });

  WooOrderCouponLine.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      code = json['code'],
      discount = double.tryParse(json['discount']),
      discountTax = double.tryParse(json['discount_tax']),
      metaData = (json['meta_data'] as List)
          .map((i) => WooMetaData.fromJson(i))
          .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (code != null) data['code'] = code;
    if (discount != null) data['discount'] = discount.toString();
    if (discountTax != null) data['discount_tax'] = discountTax.toString();
    if (metaData.isNotEmpty)
      data['meta_data'] = metaData.map((v) => v.toJson()).toList();
    return data;
  }

  factory WooOrderCouponLine.fake() => WooOrderCouponLine(
    id: FakeHelper.integer(),
    code: FakeHelper.word(),
    discount: FakeHelper.decimal(),
    discountTax: FakeHelper.decimal(),
    metaData: FakeHelper.list(() => WooMetaData.fake()),
  );
}
