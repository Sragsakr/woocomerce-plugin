# WooCommerce Plugin

[![GitHub Repo](https://img.shields.io/badge/GitHub-Sragsakr%2Fwoo--api-181717?logo=github)](https://github.com/Sragsakr/woo-api)
[![GitHub License](https://img.shields.io/github/license/Sragsakr/woo-api)](https://github.com/Sragsakr/woo-api/blob/main/LICENSE)

A Flutter/Dart package for WooCommerce:

- WooCommerce REST API (`/wp-json/wc/v3`)
- WooCommerce Store API (`/wp-json/wc/store/v1`)
- JWT Authentication endpoints

It includes strongly-typed models, API extensions over a shared client, and optional fake data mode for local development.

---

## Features

- Authentication: login token, token validation, customer profile helpers
- Products: list/search/filter/get single product
- Categories, attributes, terms, and variations
- Orders and coupons
- Store API cart and checkout flows
- Shipping, payment gateways, settings, and currency APIs
- Typed JSON models with `fromJson` / `toJson`
- `useFaker` mode for mock responses

---

## Installation

```yaml
dependencies:
  woocommerce_plugin: ^1.0.0
```

Then run:

```bash
flutter pub get
```

or:

```bash
dart pub get
```

---

## Quick Start

```dart
import 'package:woocommerce_plugin/woocommerce_plugin.dart';

void main() async {
  final woo = FlutterWooCommerce(
    baseUrl: 'https://yourstore.com',
    username: 'ck_your_consumer_key',
    password: 'cs_your_consumer_secret',
    apiPath: '/wp-json/wc/v3',
    isDebug: true,
    useFaker: false,
    lang: 'en',
    timeout: 60,
  );

  final products = await woo.getProducts(page: 1, perPage: 10);
  print(products.length);
}
```

---

## Common Usage

### Products

```dart
final products = await woo.getProducts(
  page: 1,
  perPage: 20,
  search: 'shirt',
  onSale: true,
);
```

### Single Product

```dart
final product = await woo.getProduct(id: 123);
```

### Orders

```dart
final orders = await woo.getOrders(
  page: 1,
  perPage: 20,
);
```

### Store API Cart

```dart
final cart = await woo.getStoreCart();

await woo.addItemToStoreCart(
  id: 123,
  quantity: 2,
);
```

### Checkout

```dart
final checkout = await woo.getCheckoutData();
```

---

## Fake Data Mode

You can enable mock responses globally:

```dart
final woo = FlutterWooCommerce(
  baseUrl: 'https://yourstore.com',
  username: 'ck_key',
  password: 'cs_secret',
  useFaker: true,
);
```

Or per request:

```dart
final products = await woo.getProducts(useFaker: true);
```

---

## Security Notes

Store/cart token persistence uses encrypted local storage with `AES-256-GCM`.

To enable persistent encrypted storage in pure Dart environments, set:

```bash
export WOOCOMMERCE_STORAGE_KEY_B64="$(openssl rand -base64 32)"
```

If `WOOCOMMERCE_STORAGE_KEY_B64` is not provided, sensitive data is kept in memory only and not persisted to disk.

---

## Public API Entry Point

Import this package via:

```dart
import 'package:woocommerce_plugin/woocommerce_plugin.dart';
```

---

## Example

See `example/main.dart` for a runnable example.

---

## Issues and Contributions

- Issues: [GitHub Issues](https://github.com/Sragsakr/woo-api/issues)
- Contributions are welcome via pull requests.

---

## License

MIT
# woocomerce-plugin
