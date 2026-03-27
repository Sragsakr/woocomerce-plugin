import 'package:faker/faker.dart';

enum WooCouponDiscountType {
  percent,
  fixedCart,
  fixedProduct,
  percentProduct;

  static WooCouponDiscountType fake() {
    return values[Faker().randomGenerator.integer(values.length - 1)];
  }

  static WooCouponDiscountType fromString(String type) {
    if (type == 'fixed_cart') {
      return WooCouponDiscountType.fixedCart;
    }
    if (type == 'fixed_product') {
      return WooCouponDiscountType.fixedProduct;
    }
    if (type == 'percent_product') {
      return WooCouponDiscountType.percentProduct;
    }
    return WooCouponDiscountType.percent;
  }

  @override
  String toString() {
    switch (this) {
      case WooCouponDiscountType.percent:
        return 'percent';
      case WooCouponDiscountType.fixedCart:
        return 'fixed_cart';
      case WooCouponDiscountType.fixedProduct:
        return 'fixed_product';
      case WooCouponDiscountType.percentProduct:
        return 'percent_product';
    }
  }

  /// Convert enum to WooCommerce string
  static String toValue(WooCouponDiscountType? s) {
    if (s == null) return "fixed_cart";
    return s.toString();
  }
}

