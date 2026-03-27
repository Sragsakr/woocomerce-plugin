import 'package:faker/faker.dart';

enum WooCouponStatus {
  draft,
  pending,
  private,
  publish;

  static WooCouponStatus fake() {
    return values[Faker().randomGenerator.integer(values.length - 1)];
  }

  static WooCouponStatus fromString(String type) {
    if (type == 'draft') {
      return WooCouponStatus.draft;
    }
    if (type == 'pending') {
      return WooCouponStatus.pending;
    }
    if (type == 'private') {
      return WooCouponStatus.private;
    }
    return WooCouponStatus.publish;
  }

  @override
  String toString() {
    switch (this) {
      case WooCouponStatus.draft:
        return 'draft';
      case WooCouponStatus.pending:
        return 'pending';
      case WooCouponStatus.private:
        return 'private';
      case WooCouponStatus.publish:
        return 'publish';
    }
  }

  /// Convert enum to WooCommerce string
  static String toValue(WooCouponStatus? s) {
    if (s == null) return "publish";
    return s.toString();
  }
}

