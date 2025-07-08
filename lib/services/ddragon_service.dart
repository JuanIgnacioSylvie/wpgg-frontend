import 'dart:convert';
import 'package:http/http.dart' as http;

/// Service to build Data Dragon image URLs and fetch the latest version.
class DDragonService {
  DDragonService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  String? _version;
  static const String _versionUrl =
      'https://ddragon.leagueoflegends.com/api/versions.json';

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
      "${_baseUrl}/champion/${championName}.png";
  String profileIcon(int id) => "${_baseUrl}/profileicon/${id}.png";
  String itemIcon(int id) => "${_baseUrl}/item/${id}.png";

  static const Map<int, String> _spellMap = {
    21: 'SummonerBarrier',
    1: 'SummonerBoost',
    14: 'SummonerDot',
    3: 'SummonerExhaust',
    4: 'SummonerFlash',
    6: 'SummonerHaste',
    7: 'SummonerHeal',
    13: 'SummonerMana',
    30: 'SummonerPoroRecall',
    31: 'SummonerPoroThrow',
    11: 'SummonerSmite',
    39: 'SummonerSnowURFSnowball_Mark',
    32: 'SummonerSnowball',
    12: 'SummonerTeleport',
  };

  String? summonerSpellIcon(int? id) {
    final name = _spellMap[id];
    if (name == null) return null;
    return "${_baseUrl}/spell/${name}.png";
  }

  void dispose() => _client.close();
}
