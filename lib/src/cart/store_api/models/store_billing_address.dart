// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'store_billing_address.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreBillingAddress {
  /// First name
  @JsonKey(name: 'first_name')
  String? firstName;

  /// Last name
  @JsonKey(name: 'last_name')
  String? lastName;

  /// Company name
  @JsonKey(name: 'company')
  String? company;

  /// Address line 1
  @JsonKey(name: 'address_1')
  String? address1;

  /// Address line 2
  @JsonKey(name: 'address_2')
  String? address2;

  /// City
  @JsonKey(name: 'city')
  String? city;

  /// State/Province code or name
  @JsonKey(name: 'state')
  String? state;

  /// Postal code
  @JsonKey(name: 'postcode')
  String? postcode;

  /// Country code (ISO)
  @JsonKey(name: 'country')
  String? country;

  /// Email address
  @JsonKey(name: 'email')
  String? email;

  /// Phone number
  @JsonKey(name: 'phone')
  String? phone;

  StoreBillingAddress({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.email,
    this.phone,
  });

  factory StoreBillingAddress.fromJson(Map<String, dynamic> json) =>
      _$StoreBillingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$StoreBillingAddressToJson(this);
  factory StoreBillingAddress.fromCustomer(WooCustomer customer) =>
      StoreBillingAddress(
        firstName: customer.billing?.firstName,
        lastName: customer.billing?.lastName,
        company: customer.billing?.company,
        address1: customer.billing?.address1,
        address2: customer.billing?.address2,
        city: customer.billing?.city,
        state: customer.billing?.state,
        postcode: customer.billing?.postcode,
        country: customer.billing?.country,
      );
  factory StoreBillingAddress.empty() => StoreBillingAddress(
    firstName: '',
    lastName: '',
    company: '',
    address1: '',
    address2: '',
    city: '',
    state: '',
  );
  static StoreBillingAddress fake() => StoreBillingAddress(
    firstName: FakeHelper.word(),
    lastName: FakeHelper.word(),
    company: FakeHelper.word(),
    address1: FakeHelper.word(),
    address2: FakeHelper.word(),
    city: FakeHelper.word(),
    state: FakeHelper.word(),
    postcode: FakeHelper.word(),
    country: 'US',
    email: 'test@example.com',
    phone: '1234567890',
  );
}
