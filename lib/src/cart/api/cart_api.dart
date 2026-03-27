import 'package:dio/dio.dart';
import '../../../woocommerce_flutter_api.dart';

part 'endpoints.dart';

extension WooCartApi on FlutterWooCommerce {
  ///
  /// [useFaker], fakes the api request
  Future<WooCart> getCart({bool? useFaker}) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return WooCart.fake();
    }

    try {
      final response = await dio.get(_CartEndpoints.cart, queryParameters: {});
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return WooCart.fromJson(response.data);
      } else {
        throw Exception(
          "API call failed with status code: ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMsg");
    } catch (e) {
      throw Exception("Unexpected error in API call: $e");
    }
  }

  /// [items] the items of the cart
  /// if the item has a quantity equal to 0 then it will be deleted from the cart
  ///
  /// [useFaker], fakes the api request
  Future<WooCart> updateCart(List<WooCartItem> items, {bool? useFaker}) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return WooCart.fake();
    }

    try {
      final response = await dio.post(
        _CartEndpoints.cart,
        data: {'user_id': await LocalStorageHelper.getSecurityUserId()},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return WooCart.fromJson(response.data);
      } else {
        throw Exception(
          "API call failed with status code: ${response.statusCode}",
        );
      }
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMsg");
    } catch (e) {
      throw Exception("Unexpected error in API call: $e");
    }
  }
}
