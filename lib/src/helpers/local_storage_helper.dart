import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

abstract class LocalStorageHelper {
  static const String _cartTokenKey = 'cart_token';
  static const String _securityUserIdKey = 'security_user_id';
  static const String _fileName = 'woocommerce_flutter_api_local_storage.json';
  static const String _encryptionKeyEnv = 'WOOCOMMERCE_STORAGE_KEY_B64';

  static Map<String, dynamic>? _cache;

  static Future<void> updateSecurityUserId(int? userId) async {
    final storage = await _readStorage();
    if (userId == null) {
      storage.remove(_securityUserIdKey);
    } else {
      storage[_securityUserIdKey] = userId;
    }
    await _writeStorage(storage);
  }

  static Future<void> deleteSecurityUserId() async {
    final storage = await _readStorage();
    storage.remove(_securityUserIdKey);
    await _writeStorage(storage);
  }

  static Future<int?> getSecurityUserId() async {
    final storage = await _readStorage();
    final value = storage[_securityUserIdKey];
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }

  /// Store cart token for Store API cart operations
  /// This token is extracted from the first getStoreCart() call and used in subsequent API calls
  static Future<void> storeCartToken(String? cartToken) async {
    final storage = await _readStorage();
    if (cartToken == null || cartToken.isEmpty) {
      storage.remove(_cartTokenKey);
    } else {
      storage[_cartTokenKey] = cartToken;
    }
    await _writeStorage(storage);
  }

  /// Get stored cart token for Store API cart operations
  /// Returns the cart token that was saved from the first getStoreCart() call
  static Future<String?> getCartToken() async {
    final storage = await _readStorage();
    final value = storage[_cartTokenKey];
    if (value is String && value.isNotEmpty) {
      return value;
    }
    return null;
  }

  /// Delete stored cart token
  static Future<void> deleteCartToken() async {
    final storage = await _readStorage();
    storage.remove(_cartTokenKey);
    await _writeStorage(storage);
  }

  static Future<Map<String, dynamic>> _readStorage() async {
    if (_cache != null) {
      return Map<String, dynamic>.from(_cache!);
    }

    final keyBytes = _encryptionKeyBytes();
    if (keyBytes == null) {
      _cache = <String, dynamic>{};
      return <String, dynamic>{};
    }

    try {
      final file = await _storageFile();
      if (!await file.exists()) {
        _cache = <String, dynamic>{};
        return <String, dynamic>{};
      }

      final raw = await file.readAsString();
      if (raw.trim().isEmpty) {
        _cache = <String, dynamic>{};
        return <String, dynamic>{};
      }

      final decodedEnvelope = jsonDecode(raw);
      if (decodedEnvelope is! Map<String, dynamic>) {
        _cache = <String, dynamic>{};
        return <String, dynamic>{};
      }

      final decrypted = await _decryptPayload(decodedEnvelope, keyBytes);
      if (decrypted is Map<String, dynamic>) {
        _cache = Map<String, dynamic>.from(decrypted);
        return Map<String, dynamic>.from(_cache!);
      }
    } catch (_) {
      // Ignore malformed/unavailable/encryption errors and fallback to memory.
    }

    _cache = <String, dynamic>{};
    return <String, dynamic>{};
  }

  static Future<void> _writeStorage(Map<String, dynamic> storage) async {
    _cache = Map<String, dynamic>.from(storage);

    final keyBytes = _encryptionKeyBytes();
    if (keyBytes == null) {
      return;
    }

    try {
      final file = await _storageFile();
      await file.parent.create(recursive: true);
      final encrypted = await _encryptPayload(_cache!, keyBytes);
      await file.writeAsString(jsonEncode(encrypted));
    } catch (_) {
      // Ignore write errors to keep API usage non-fatal.
    }
  }

  static Future<File> _storageFile() async {
    final dir = await _baseDirectory();
    return File('${dir.path}${Platform.pathSeparator}$_fileName');
  }

  static Future<Directory> _baseDirectory() async {
    final envHome = Platform.environment['HOME'];
    if (envHome != null && envHome.isNotEmpty) {
      return Directory(envHome);
    }
    return Directory.systemTemp;
  }

  static List<int>? _encryptionKeyBytes() {
    final rawKey = Platform.environment[_encryptionKeyEnv];
    if (rawKey == null || rawKey.isEmpty) {
      return null;
    }

    try {
      final bytes = base64Decode(rawKey);
      if (bytes.length != 32) {
        return null;
      }
      return bytes;
    } catch (_) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> _encryptPayload(
    Map<String, dynamic> payload,
    List<int> keyBytes,
  ) async {
    final cipher = AesGcm.with256bits();
    final secretKey = SecretKey(keyBytes);
    final encodedPayload = utf8.encode(jsonEncode(payload));
    final secretBox = await cipher.encrypt(encodedPayload, secretKey: secretKey);

    return <String, dynamic>{
      'v': 1,
      'nonce': base64Encode(secretBox.nonce),
      'cipher_text': base64Encode(secretBox.cipherText),
      'mac': base64Encode(secretBox.mac.bytes),
    };
  }

  static Future<Map<String, dynamic>?> _decryptPayload(
    Map<String, dynamic> envelope,
    List<int> keyBytes,
  ) async {
    final nonceBase64 = envelope['nonce'];
    final cipherTextBase64 = envelope['cipher_text'];
    final macBase64 = envelope['mac'];

    if (nonceBase64 is! String || cipherTextBase64 is! String || macBase64 is! String) {
      return null;
    }

    final cipher = AesGcm.with256bits();
    final secretBox = SecretBox(
      base64Decode(cipherTextBase64),
      nonce: base64Decode(nonceBase64),
      mac: Mac(base64Decode(macBase64)),
    );
    final secretKey = SecretKey(keyBytes);
    final clearBytes = await cipher.decrypt(secretBox, secretKey: secretKey);
    final decoded = jsonDecode(utf8.decode(Uint8List.fromList(clearBytes)));
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }
    return null;
  }
}
