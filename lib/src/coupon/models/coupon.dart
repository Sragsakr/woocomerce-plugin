// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../woocommerce_flutter_api.dart';


part 'coupon.g.dart';

@JsonSerializable()
class WooCoupon {
  /// Unique identifier for the resource.
  @JsonKey(name: 'id', includeIfNull: false)
  int? id;

  /// Coupon code.
  @JsonKey(name: 'code', includeIfNull: false)
  String? code;

  /// The amount of discount. Should always be numeric, even if setting a percentage.
  @JsonKey(name: 'amount', includeIfNull: false)
  String? amount;

  /// Coupon status. Options: publish, draft, pending, private. Default is publish.
  @JsonKey(
    name: 'status',
    includeIfNull: false,
    fromJson: WooCouponStatus.fromString,
    toJson: WooCouponStatus.toValue,
  )
  WooCouponStatus? status;

  /// The date the coupon was created, in the site's timezone.
  @JsonKey(name: 'date_created')
  DateTime? dateCreated;

  /// The date the coupon was created, as GMT.
  @JsonKey(name: 'date_created_gmt')
  DateTime? dateCreatedGmt;

  /// The date the coupon was last modified, in the site's timezone.
  @JsonKey(name: 'date_modified')
  DateTime? dateModified;

  /// The date the coupon was last modified, as GMT.
  @JsonKey(name: 'date_modified_gmt')
  DateTime? dateModifiedGmt;

  /// Type of discount. Options: percent, fixed_cart, fixed_product, percent_product. Default is fixed_cart.
  @JsonKey(
    name: 'discount_type',
    includeIfNull: false,
    fromJson: WooCouponDiscountType.fromString,
    toJson: WooCouponDiscountType.toValue,
  )
  WooCouponDiscountType? discountType;

  /// Coupon description.
  @JsonKey(name: 'description', includeIfNull: false)
  String? description;

  /// The date the coupon expires, in the site's timezone.
  @JsonKey(name: 'date_expires')
  DateTime? dateExpires;

  /// The date the coupon expires, as GMT.
  @JsonKey(name: 'date_expires_gmt')
  DateTime? dateExpiresGmt;

  /// Number of times the coupon has been used already.
  @JsonKey(name: 'usage_count')
  int? usageCount;

  /// If true, the coupon can only be used individually. Other applied coupons will be removed from the cart. Default is false.
  @JsonKey(name: 'individual_use')
  bool? individualUse;

  /// List of product IDs the coupon can be used on.
  @JsonKey(name: 'product_ids')
  List<int>? productIds;

  /// List of product IDs the coupon cannot be used on.
  @JsonKey(name: 'excluded_product_ids')
  List<int>? excludedProductIds;

  /// How many times the coupon can be used in total.
  @JsonKey(name: 'usage_limit')
  int? usageLimit;

  /// How many times the coupon can be used per customer.
  @JsonKey(name: 'usage_limit_per_user')
  int? usageLimitPerUser;

  /// Max number of items in the cart the coupon can be applied to.
  @JsonKey(name: 'limit_usage_to_x_items')
  int? limitUsageToXItems;

  /// If true and if the free shipping method requires a coupon, this coupon will enable free shipping. Default is false.
  @JsonKey(name: 'free_shipping')
  bool? freeShipping;

  /// List of category IDs the coupon applies to.
  @JsonKey(name: 'product_categories')
  List<int>? productCategories;

  /// List of category IDs the coupon does not apply to.
  @JsonKey(name: 'excluded_product_categories')
  List<int>? excludedProductCategories;

  /// If true, this coupon will not be applied to items that have sale prices. Default is false.
  @JsonKey(name: 'exclude_sale_items')
  bool? excludeSaleItems;

  /// Minimum order amount that needs to be in the cart before coupon applies.
  @JsonKey(name: 'minimum_amount')
  String? minimumAmount;

  /// Maximum order amount allowed when using the coupon.
  @JsonKey(name: 'maximum_amount')
  String? maximumAmount;

  /// List of email addresses that can use this coupon.
  @JsonKey(name: 'email_restrictions')
  List<String>? emailRestrictions;

  /// List of user IDs (or guest emails) that have used the coupon.
  @JsonKey(name: 'used_by')
  List<String>? usedBy;

  /// Meta data.
  @JsonKey(name: 'meta_data')
  List<WooMetaData>? metaData;

  /// Links to related resources.
  @JsonKey(name: '_links')
  WooCouponLinks? links;

  WooCoupon({
    this.id,
    this.code,
    this.amount,
    this.status,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.discountType,
    this.description,
    this.dateExpires,
    this.dateExpiresGmt,
    this.usageCount,
    this.individualUse,
    this.productIds,
    this.excludedProductIds,
    this.usageLimit,
    this.usageLimitPerUser,
    this.limitUsageToXItems,
    this.freeShipping,
    this.productCategories,
    this.excludedProductCategories,
    this.excludeSaleItems,
    this.minimumAmount,
    this.maximumAmount,
    this.emailRestrictions,
    this.usedBy,
    this.metaData,
    this.links,
  });

  factory WooCoupon.fromJson(Map<String, dynamic> json) =>
      _$WooCouponFromJson(json);

  Map<String, dynamic> toJson() => _$WooCouponToJson(this);

  @override
  String toString() => toJson().toString();

  static WooCoupon fake() => WooCoupon(
    id: FakeHelper.integer(),
    code: FakeHelper.word(),
    amount: FakeHelper.decimal().toStringAsFixed(2),
    status: WooCouponStatus.fake(),
    dateCreated: FakeHelper.datetime(),
    dateCreatedGmt: FakeHelper.datetime(),
    dateModified: FakeHelper.datetime(),
    dateModifiedGmt: FakeHelper.datetime(),
    discountType: WooCouponDiscountType.fake(),
    description: FakeHelper.sentence(),
    dateExpires: FakeHelper.datetime(),
    dateExpiresGmt: FakeHelper.datetime(),
    usageCount: FakeHelper.integer(),
    individualUse: FakeHelper.boolean(),
    productIds: FakeHelper.listOfIntegers(),
    excludedProductIds: FakeHelper.listOfIntegers(),
    usageLimit: FakeHelper.integer(),
    usageLimitPerUser: FakeHelper.integer(),
    limitUsageToXItems: FakeHelper.integer(),
    freeShipping: FakeHelper.boolean(),
    productCategories: FakeHelper.listOfIntegers(),
    excludedProductCategories: FakeHelper.listOfIntegers(),
    excludeSaleItems: FakeHelper.boolean(),
    minimumAmount: FakeHelper.decimal().toStringAsFixed(2),
    maximumAmount: FakeHelper.decimal().toStringAsFixed(2),
    emailRestrictions: FakeHelper.list(() => FakeHelper.email()),
    usedBy: FakeHelper.list(() => FakeHelper.email()),
    metaData: FakeHelper.list(() => WooMetaData.fake()),
    links: WooCouponLinks.fake(),
  );
}
