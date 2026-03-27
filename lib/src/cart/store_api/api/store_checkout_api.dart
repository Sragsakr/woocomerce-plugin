import 'dart:io';

import 'package:dio/dio.dart';
import '../../../../woocommerce_flutter_api.dart';

part 'checkout_endpoints.dart';

extension WooStoreCheckoutApi on FlutterWooCommerce {
  /// Helper method to build headers for Store API requests
  ///
  /// [bearerToken] Optional Bearer token for authenticated users
  /// Returns headers with Cart-Token (if available) or Authorization (if bearerToken provided)
  Future<Map<String, dynamic>> _buildStoreApiHeaders({String? bearerToken}) async {
    final headers = <String, dynamic>{};

    // If bearer token is provided, use it for authenticated requests
    if (bearerToken != null && bearerToken.isNotEmpty) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $bearerToken';
    }

    // For guest mode (no bearer token), ensure we have a cart token
    if (bearerToken == null || bearerToken.isEmpty) {
      var cartToken = await LocalStorageHelper.getCartToken();
      headers['Cart-Token'] = cartToken;
      headers.removeWhere((key, value) => key == "authorization");
    } else {
      // For authenticated users, still try to send cart token if available
      final cartToken = await LocalStorageHelper.getCartToken();
      if (cartToken != null && cartToken.isNotEmpty) {
        headers['Cart-Token'] = cartToken;
      }
    }

    // Remove any null or empty values from headers
    headers.removeWhere((key, value) => value == null || (value is String && value.isEmpty));

    return headers;
  }

  /// Extract and store cart token from response headers
  Future<void> _extractAndStoreCartToken(Response response, {String? bearerToken}) async {
    // Try different possible header names for cart token
    String? cartToken =
        response.headers.value('Cart-Token') ??
        response.headers.value('X-Cart-Token') ??
        response.headers.value('cart-token');

    // Store cart token if available
    if (cartToken != null && cartToken.isNotEmpty) {
      await LocalStorageHelper.storeCartToken(cartToken);
    }
  }

  /// Extract error message from response data
  /// Handles various error response formats from WooCommerce Store API
  String? _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return null;

    // Try different possible error message fields
    if (responseData is Map<String, dynamic>) {
      // Standard WooCommerce error format
      if (responseData.containsKey('message')) {
        return responseData['message']?.toString();
      }

      // Alternative error formats
      if (responseData.containsKey('error')) {
        final error = responseData['error'];
        if (error is String) return error;
        if (error is Map && error.containsKey('message')) {
          return error['message']?.toString();
        }
      }

      // Check for data.message format
      if (responseData.containsKey('data')) {
        final data = responseData['data'];
        if (data is Map && data.containsKey('message')) {
          return data['message']?.toString();
        }
      }

      // Check for code and message combination
      if (responseData.containsKey('code') && responseData.containsKey('message')) {
        return responseData['message']?.toString();
      }
    }

    // If responseData is a string, return it directly
    if (responseData is String) {
      return responseData;
    }

    return null;
  }

  /// Extract error message from DioException
  /// Handles various DioException error response formats
  String? _extractErrorMessageFromDio(DioException e) {
    // First try to extract from response data
    if (e.response?.data != null) {
      final extracted = _extractErrorMessage(e.response!.data);
      if (extracted != null) return extracted;
    }

    // Fallback to response status message
    if (e.response?.statusMessage != null) {
      return e.response!.statusMessage;
    }

    // Fallback to DioException message
    return e.message;
  }

  /// Get checkout data
  ///
  /// Returns data required for checkout including draft order and customer addresses
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the checkout data object
  Future<StoreCheckoutData> getCheckoutData({String? bearerToken, bool? useFaker}) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCheckoutData.fake();
    }

    try {
      // Store the original base URL
      final originalBaseUrl = dio.options.baseUrl;

      // Use Store API base path
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      // Create Options that explicitly removes Basic auth for Store API
      final options = Options(
        headers: {
          ...headers,
          // Explicitly remove Authorization if not set (to override BaseOptions Basic auth)
          if (!headers.containsKey(HttpHeaders.authorizationHeader))
            HttpHeaders.authorizationHeader: '', // Empty string removes the header
        },
      );

      final response = await dio.get(_StoreCheckoutEndpoints.checkout, options: options);
      dPrint("bearerToken: $bearerToken");
      // Extract and store cart token from response headers
      await _extractAndStoreCartToken(response, bearerToken: bearerToken);

      // Restore original base URL
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return StoreCheckoutData.fromJson(response.data);
      } else {
        throw Exception("API call failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMsg");
    } catch (e) {
      throw Exception("Unexpected error in API call: ${e.toString()}");
    }
  }

  /// Update checkout data
  ///
  /// Updates checkout fields (payment method, order notes, additional fields)
  /// [request] Checkout update request data
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the updated checkout data object
  /// Note: After this call, refresh cart totals via StoreCartCubit.refreshCart()
  Future<StoreCheckoutData> updateCheckoutData({
    required StoreCheckoutUpdateRequest request,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCheckoutData.fake();
    }

    try {
      // Store the original base URL
      final originalBaseUrl = dio.options.baseUrl;

      // Use Store API base path
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      dPrint("bearerToken: $bearerToken");

      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      // Create Options that explicitly removes Basic auth for Store API
      final options = Options(
        headers: {
          ...headers,
          // Explicitly remove Authorization if not set (to override BaseOptions Basic auth)
          if (!headers.containsKey(HttpHeaders.authorizationHeader))
            HttpHeaders.authorizationHeader: '', // Empty string removes the header
        },
      );

      // Include __experimental_calc_totals=true to recalculate totals
      final response = await dio.put(
        _StoreCheckoutEndpoints.checkout,
        data: request.toJson(),
        options: options,
        queryParameters: {'__experimental_calc_totals': 'true'},
      );

      // Extract and store cart token from response headers
      await _extractAndStoreCartToken(response, bearerToken: bearerToken);

      // Restore original base URL
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return StoreCheckoutData.fromJson(response.data);
      } else if (response.statusCode == 409) {
        final data = response.data["data"]["cart"];
      final cart = StoreCart.fromJson(data);
      // await getIt<StoreCartCubit>().refreshCartFromCheckout(cart);
      // Fluttertoast.showToast(msg: msg,backgroundColor: Colors.red,textColor: Colors.white);
      var checkOutData = await getCheckoutData(bearerToken: bearerToken);
      checkOutData.experimentalCart=cart;
      return checkOutData;

      } else {
        throw Exception("API call failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMsg");
    } catch (e) {
      throw Exception("Unexpected error in API call: ${e.toString()}");
    }
  }

  /// Process checkout (order and payment)
  ///
  /// Accepts final customer addresses and chosen payment method, then attempts payment
  /// [request] Checkout process request data
  /// [bearerToken] Optional Bearer token for authenticated users
  /// [useFaker] Fakes the API request
  ///
  /// Returns the checkout data object with payment result
  Future<StoreCheckoutData> processCheckout({
    required StoreCheckoutProcessRequest request,
    String? bearerToken,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return StoreCheckoutData.fake();
    }

    try {
      // Store the original base URL
      final originalBaseUrl = dio.options.baseUrl;

      // Use Store API base path
      dio.options.baseUrl = '$baseUrl/wp-json/wc/store/v1';
      dio.options.headers = {};
      final headers = await _buildStoreApiHeaders(bearerToken: bearerToken);

      // Create Options that explicitly removes Basic auth for Store API
      final options = Options(
        headers: {
          ...headers,
          // Explicitly remove Authorization if not set (to override BaseOptions Basic auth)
          if (!headers.containsKey(HttpHeaders.authorizationHeader))
            HttpHeaders.authorizationHeader: '', // Empty string removes the header
        },
      );

      final response = await dio.post(_StoreCheckoutEndpoints.checkout, data: request.toJson(), options: options);

      // Extract and store cart token from response headers
      await _extractAndStoreCartToken(response, bearerToken: bearerToken);

      // Restore original base URL
      dio.options.baseUrl = originalBaseUrl;

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return StoreCheckoutData.fromJson(response.data);
      } else {
        final errorMsg =
            _extractErrorMessage(response.data) ?? "API call failed with status code: ${response.statusCode}";
        throw Exception(errorMsg.toString().cleanErrorMessage);
      }
    } on DioException catch (e) {
      final errorMsg = _extractErrorMessageFromDio(e) ?? e.message ?? 'Unknown error';
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }
}
