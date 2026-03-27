import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'endpoints.dart';

extension WooStoreCartApi on FlutterWooCommerce {
  /// Helper method to build headers for Store API requests
  ///
  /// [bearerToken] Optional Bearer token for authenticated users
  /// Returns headers with Cart-Token (if available) or Authorization (if bearerToken provided)
  /// For guest users, ensures cart token is a valid UUID
  /// IMPORTANT: Removes Basic auth header from BaseOptions for Store API calls
  /// Store API should NOT use Basic auth (consumer key/secret from BaseOptions)
  Future<Map<String, dynamic>> _buildStoreApiHeaders({
    String? bearerToken,
  }) async {
    final headers = <String, dynamic>{};

    // IMPORTANT: Store API should NOT use Basic auth (consumer key/secret)
    // It should only use Cart-Token (guest) or Bearer token (authenticated)
    // To remove Basic auth from BaseOptions, we need to explicitly override it
    // Note: Dio merges headers from BaseOptions, so we need to explicitly override Authorization

    // If bearer token is provided, use it for authenticated requests
    if (bearerToken != null && bearerToken.isNotEmpty) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $bearerToken';
    } else {
      // For guest mode: Explicitly remove Basic auth by not setting Authorization
      // Since Dio merges BaseOptions, we need to ensure Authorization is not included
      // We'll filter it out in the final step
    }

    // For guest mode (no bearer token), ensure we have a valid UUID cart token
    if (bearerToken == null || bearerToken.isEmpty) {
      var cartToken = await LocalStorageHelper.getCartToken();

      // // If no token or invalid UUID, generate a new one
      // if (cartToken == null || cartToken.isEmpty || !UuidHelper.isValidUuid(cartToken)) {
      //   cartToken = UuidHelper.generateUuid();
      //   await LocalStorageHelper.storeCartToken(cartToken);
      // }

      headers['Cart-Token'] = cartToken;
      headers.removeWhere((key, value) => key == "authorization");
      dPrint("headers is $headers");
    } else {
      // For authenticated users, still try to send cart token if available
      final cartToken = await LocalStorageHelper.getCartToken();
      if (cartToken != null && cartToken.isNotEmpty) {
        headers['Cart-Token'] = cartToken;
      }
    }

    // Remove any null or empty values from headers
    // This ensures we don't send empty Authorization headers
    headers.removeWhere(
      (key, value) => value == null || (value is String && value.isEmpty),
    );

    return headers;
  }

  /// Extract and store cart token from response headers
  /// This token is extracted on the first getStoreCart() call and used in subsequent API calls
  /// For guest users, validates that token is a UUID (generates one if not)
  Future<void> _extractAndStoreCartToken(
    Response response, {
    String? bearerToken,
  }) async {
    // Try different possible header names for cart token
    String? cartToken =
        response.headers.value('Cart-Token') ??
        response.headers.value('X-Cart-Token') ??
        response.headers.value('cart-token');

    // For guest mode, ensure token is a valid UUID
    // if (bearerToken == null || bearerToken.isEmpty) {
    //   if (cartToken == null || cartToken.isEmpty || !UuidHelper.isValidUuid(cartToken)) {
    //     // Generate UUID if no token received or invalid format
    //     cartToken = UuidHelper.generateUuid();
    //   }
    // }

    // Store cart token if available
    if (cartToken != null && cartToken.isNotEmpty) {
      await LocalStorageHelper.storeCartToken(cartToken);
    }
  }

  /// Get cart
  ///
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> getStoreCart({String? bearerToken, bool? useFaker}) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      // Store the original base URL
      final originalBaseUrl = dio.options.baseUrl;

      // Use Store API base path
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      // Create Options that explicitly removes Basic auth for Store API
      // Store API should NOT use Basic auth from BaseOptions
      final options = Options(
        headers: {
          ...headers,
          // Explicitly remove Authorization if not set (to override BaseOptions Basic auth)
          if (!headers.containsKey(HttpHeaders.authorizationHeader))
            HttpHeaders.authorizationHeader:
                '', // Empty string removes the header
        },
      );

      final response = await dio.get(
        _StoreCartEndpoints.cart,
        options: options,
      );

      // Extract and store cart token from response headers
      await _extractAndStoreCartToken(response, bearerToken: bearerToken);

      // Restore original base URL
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        throw Exception(
          "API call failed with status code: ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMsg");
    } catch (e, stackTrace) {
      throw Exception(
        "Unexpected error in API call: ${e.toString()}, $stackTrace",
      );
    }
  }

  /// Add item to cart
  ///
  /// [id] Product ID (required)
  /// [quantity] Quantity to add (required)
  /// [variation] Optional variation attributes array
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> addItemToStoreCart({
    required int id,
    required int quantity,
    List<Map<String, dynamic>>? variation,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      final originalBaseUrl = dio.options.baseUrl;
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      final queryParams = <String, dynamic>{'id': id, 'quantity': quantity};
      if (variation != null) {
        // Variation is typically sent as query parameters or in body
        // Based on WooCommerce docs, sending in query params
        queryParams['variation'] = variation;
      }

      final response = await dio.post(
        _StoreCartEndpoints.addItem,
        options: Options(headers: headers),
        queryParameters: queryParams,
      );

      await _extractAndStoreCartToken(response, bearerToken: bearerToken);
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        final errorMsg =
            response.data["message"] ??
            "API call failed with status code: ${response.statusCode}";
        throw Exception(errorMsg.toString().cleanErrorMessage);
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }

  /// Remove item from cart
  ///
  /// [key] Cart item key (required)
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> removeItemFromStoreCart({
    required String key,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      final originalBaseUrl = dio.options.baseUrl;
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      final response = await dio.post(
        _StoreCartEndpoints.removeItem,
        options: Options(headers: headers),
        queryParameters: {'key': key},
      );

      await _extractAndStoreCartToken(response, bearerToken: bearerToken);
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        final errorMsg =
            response.data["message"] ??
            "API call failed with status code: ${response.statusCode}";
        throw Exception(errorMsg.toString().cleanErrorMessage);
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }

  /// Update item quantity in cart
  ///
  /// [key] Cart item key (required)
  /// [quantity] New quantity (required)
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> updateItemInStoreCart({
    required String key,
    required int quantity,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      final originalBaseUrl = dio.options.baseUrl;
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      final response = await dio.post(
        _StoreCartEndpoints.updateItem,
        options: Options(headers: headers),
        queryParameters: {'key': key, 'quantity': quantity},
      );

      await _extractAndStoreCartToken(response, bearerToken: bearerToken);
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        final errorMsg =
            response.data["message"] ??
            "API call failed with status code: ${response.statusCode}";
        throw Exception(errorMsg.toString().cleanErrorMessage);
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }

  /// Apply coupon to cart
  ///
  /// [code] Coupon code (required)
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> applyCouponToStoreCart({
    required String code,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      final originalBaseUrl = dio.options.baseUrl;
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      final response = await dio.post(
        _StoreCartEndpoints.applyCoupon,
        options: Options(headers: headers),
        queryParameters: {'code': code},
      );

      await _extractAndStoreCartToken(response, bearerToken: bearerToken);
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        final errorMsg =
            response.data["message"] ??
            "API call failed with status code: ${response.statusCode}";
        throw Exception(errorMsg.toString().cleanErrorMessage);
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }

  /// Remove coupon from cart
  ///
  /// [code] Coupon code (required)
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> removeCouponFromStoreCart({
    required String code,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      final originalBaseUrl = dio.options.baseUrl;
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      final response = await dio.post(
        _StoreCartEndpoints.removeCoupon,
        options: Options(headers: headers),
        queryParameters: {'code': code},
      );

      await _extractAndStoreCartToken(response, bearerToken: bearerToken);
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        final errorMsg =
            response.data["message"] ??
            "API call failed with status code: ${response.statusCode}";
        throw Exception(errorMsg.toString().cleanErrorMessage);
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }

  /// Update customer data in cart
  ///
  /// [billingAddress] Optional billing address
  /// [shippingAddress] Optional shipping address
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> updateCustomerInStoreCart({
    StoreBillingAddress? billingAddress,
    StoreShippingAddress? shippingAddress,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      final originalBaseUrl = dio.options.baseUrl;
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      final data = <String, dynamic>{};
      if (billingAddress != null) {
        data['billing_address'] = billingAddress.toJson();
      }
      if (shippingAddress != null) {
        data['shipping_address'] = shippingAddress.toJson();
      }

      final response = await dio.post(
        _StoreCartEndpoints.updateCustomer,
        data: data,
        options: Options(headers: headers),
      );

      await _extractAndStoreCartToken(response, bearerToken: bearerToken);
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        throw Exception(
          "API call failed with status code: ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }

  /// Select shipping rate for a package
  ///
  /// [packageId] Package ID (required)
  /// [rateId] Rate ID (required)
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the full cart object response
  Future<StoreCart> selectShippingRateInStoreCart({
    required int packageId,
    required String rateId,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCart.fake();
    }

    try {
      final originalBaseUrl = dio.options.baseUrl;
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      final response = await dio.post(
        _StoreCartEndpoints.selectShippingRate,
        options: Options(headers: headers),
        queryParameters: {'package_id': packageId, 'rate_id': rateId},
      );

      await _extractAndStoreCartToken(response, bearerToken: bearerToken);
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return StoreCart.fromJson(response.data);
      } else {
        throw Exception(
          "API call failed with status code: ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMsg");
    } catch (e) {
      throw Exception("Unexpected error in API call: ${e.toString()}");
    }
  }
}
