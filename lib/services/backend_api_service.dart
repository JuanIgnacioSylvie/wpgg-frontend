import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app/app.locator.dart';
import 'env_service.dart';

class BackendApiService {
  BackendApiService({
    http.Client? client,
    this.timeoutTime = const Duration(seconds: 15),
  }) : _client = client ?? http.Client();

  final Duration timeoutTime;
  final http.Client _client;

  final EnvService _env = locator<EnvService>();

  static const _jsonHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<dynamic> get(
    String path, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final mergedHeaders = {..._jsonHeaders, ...?headers};

    final response =
        await _client.get(uri, headers: mergedHeaders).timeout(timeoutTime);

    _throwIfInvalid(response);
    return _decodeBody(response);
  }

  Future<dynamic> post(
    String path, {
    Map<String, String>? queryParameters,
    Map<String, dynamic> payload = const <String, dynamic>{},
    Map<String, String>? headers,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final mergedHeaders = {..._jsonHeaders, ...?headers};

    final response = await _client
        .post(
          uri,
          headers: mergedHeaders,
          body: jsonEncode(payload),
        )
        .timeout(timeoutTime);

    _throwIfInvalid(response);
    return _decodeBody(response);
  }

  void dispose() => _client.close();

  Uri _buildUri(String path, Map<String, String>? query) {
    final sanitized = path.startsWith('/') ? path : '/$path';

    return _env.backendProtocol == 'http'
        ? Uri.http(_env.backendUrl, sanitized, query)
        : Uri.https(_env.backendUrl, sanitized, query);
  }

  void _throwIfInvalid(http.Response res) {
    if (res.statusCode >= 400) {
      throw Exception('Backend error → ${res.statusCode}: ${res.body}');
    }
  }

  dynamic _decodeBody(http.Response res) {
    if (res.body.isEmpty) return {};
    try {
      return jsonDecode(res.body);
    } on FormatException {
      return res.body;
    }
  }
}
