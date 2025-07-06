import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service to build Data Dragon image URLs and fetch the latest version.
class DDragonService {
  DDragonService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  String? _version;
  static const String _versionUrl = 'https://ddragon.leagueoflegends.com/api/versions.json';

  Future<void> init() async {
    if (_version != null) return;
    try {
      final res = await _client.get(Uri.parse(_versionUrl));
      if (res.statusCode == 200) {
        final list = jsonDecode(res.body) as List<dynamic>;
        if (list.isNotEmpty) _version = list.first as String;
      }
    } catch (_) {}
  }

  String get _baseUrl {
    final ver = _version ?? 'latest';
    return 'https://ddragon.leagueoflegends.com/cdn/'
        '${ver}/img';
  }

  String championIcon(String championName) =>
      '${_baseUrl}/champion/$championName.png';
  String profileIcon(int id) => '${_baseUrl}/profileicon/$id.png';
  String itemIcon(int id) => '${_baseUrl}/item/$id.png';

  void dispose() => _client.close();
}
