import 'package:dio/dio.dart';
import '../../../woocommerce_flutter_api.dart';

part 'endpoints.dart';

extension WooPaymentApi on FlutterWooCommerce {
  /// [context] Scope under which the request is made; determines fields present in response. Options: view and edit. Default is view.
  Future<List<PaymentGateway>> getPaymentGateways({
    WooContext context = WooContext.view,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return List.generate(5, (index) => PaymentGateway.fake());
    }

    try {
      final response = await dio.get(
        _PaymentEndpoints.payments,
        queryParameters: {'context': context.name},
      );

      return (response.data as List<dynamic>)
          .map((json) => PaymentGateway.fromJson(json))
          .toList();
    } on DioException catch (e) {
      final errorMsg = e.response?.data["message"] ?? e.message;
      throw Exception(errorMsg.toString().cleanErrorMessage);
    } catch (e) {
      throw Exception(e.toString().cleanErrorMessage);
    }
  }

  /// Get a specific payment gateway by ID
  Future<PaymentGateway> getPaymentGateway({
    required String id,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return PaymentGateway.fake();
    }

    try {
      final response = await dio.get(_PaymentEndpoints.singlePayment(id));
      return PaymentGateway.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMessage");
    } catch (e) {
      throw Exception("Unexpected error in API call: $e");
    }
  }

  /// Update a payment gateway
  Future<PaymentGateway> updatePaymentGateway({
    required String id,
    required Map<String, dynamic> data,
    bool? useFaker,
  }) async {
    final isUsingFaker = useFaker ?? this.useFaker;

    if (isUsingFaker) {
      return PaymentGateway.fake();
    }

    try {
      final response = await dio.put(
        _PaymentEndpoints.singlePayment(id),
        data: data,
      );

      return PaymentGateway.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = e.response?.data["message"] ?? e.message;
      throw Exception("API call failed: $errorMessage");
    } catch (e) {
      throw Exception("Unexpected error in API call: $e");
    }
  }
}
