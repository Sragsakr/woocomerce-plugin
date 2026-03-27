// @dart=3.8
import 'package:json_annotation/json_annotation.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'store_shipping_address.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreShippingAddress {
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

  StoreShippingAddress({
    this.firstName,
    this.lastName,
    this.company,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory StoreShippingAddress.fromJson(Map<String, dynamic> json) => _$StoreShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$StoreShippingAddressToJson(this);

  factory StoreShippingAddress.fromCustomer(WooCustomer customer) => StoreShippingAddress(
    firstName: customer.shipping?.firstName,
    lastName: customer.shipping?.lastName,
    company: customer.shipping?.company,
    address1: customer.shipping?.address1,
    address2: customer.shipping?.address2,
    city: customer.shipping?.city,
    state: customer.shipping?.state,
    postcode: customer.shipping?.postcode,
    country: customer.shipping?.country,
  );

  factory StoreShippingAddress.empty() =>
      StoreShippingAddress(firstName: '', lastName: '', company: '', address1: '', address2: '', city: '', state: '');

  /// Create shipping address from billing address
  /// Copies all relevant fields from billing address to shipping address
  /// Ensures all fields are set (uses empty string if null) so they're included in JSON
  factory StoreShippingAddress.fromBillingAddress(StoreBillingAddress billing) => StoreShippingAddress(
    firstName: billing.firstName ?? '',
    lastName: billing.lastName ?? '',
    company: billing.company ?? '',
    address1: billing.address1 ?? '',
    address2: billing.address2 ?? '',
    city: billing.city ?? '',
    state: billing.state ?? '',
    postcode: billing.postcode ?? '',
    country: billing.country ?? '',
  );

  /// Check if shipping address is empty or null
  /// Returns true if address is null or all critical fields are empty/null
  /// Checks: firstName, lastName, address1, and city (minimum required fields)
  static bool isEmptyOrNull(StoreShippingAddress? address) {
    if (address == null) return true;

    // Check critical address fields that are required for shipping
    final hasFirstName = address.firstName?.trim().isNotEmpty ?? false;
    final hasLastName = address.lastName?.trim().isNotEmpty ?? false;
    final hasAddress1 = address.address1?.trim().isNotEmpty ?? false;
    final hasCity = address.city?.trim().isNotEmpty ?? false;

    // Address is considered empty if all critical fields are missing
    // At minimum, we need: name (first or last), address1, and city
    return !hasFirstName && !hasLastName && !hasAddress1 && !hasCity;
  }

  static StoreShippingAddress fake() => StoreShippingAddress(
    firstName: FakeHelper.word(),
    lastName: FakeHelper.word(),
    company: FakeHelper.word(),
    address1: FakeHelper.word(),
    address2: FakeHelper.word(),
    city: FakeHelper.word(),
    state: FakeHelper.word(),
    postcode: FakeHelper.word(),
    country: 'US',
  );
}
