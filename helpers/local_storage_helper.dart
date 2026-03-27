// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalStorageHelper {
  // static final secureStorage = FlutterSecureStorage();

  static Future<void> updateSecurityUserId(int? userId) async {
    // await secureStorage.write(key: 'userId', value: userId.toString());
  }

  static Future<void> deleteSecurityUserId() async {
    // await secureStorage.delete(key: 'userId');
  }

  static Future<int?> getSecurityUserId() async {
    // String? userId = await secureStorage.read(key: 'userId');

    return int.tryParse('c');
  }

  /// Store cart token for Store API cart operations
  static Future<void> storeCartToken(String? cartToken) async {
    // await secureStorage.write(key: 'cart_token', value: cartToken);
  }

  /// Get stored cart token for Store API cart operations
  static Future<String?> getCartToken() async {
    // String? token = await secureStorage.read(key: 'cart_token');
    return null;
  }

  /// Delete stored cart token
  static Future<void> deleteCartToken() async {
    // await secureStorage.delete(key: 'cart_token');
  }
}
