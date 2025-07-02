// lib/services/secure_storage_service.dart
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  const SecureStorageService() : _storage = const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  Future<String?> read(String key) => _storage.read(key: key);

  Future<void> delete(String key) => _storage.delete(key: key);

  Future<void> writeJson(String key, Object value) =>
      write(key, jsonEncode(value));

  /// Lee JSON; si no existe devuelve `null`
  Future<dynamic> readJson(String key) async {
    final raw = await read(key);
    return raw == null ? null : jsonDecode(raw);
  }
}
