// lib/services/ddragon_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rune.dto.dart';

class DDragonService {
  DDragonService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  String? _version;
  final Map<int, RuneDTO> _runeMap = {};
  static const Map<int, String> _shardIcon = {
    5001: 'perk-images/StatMods/StatModsHealthScalingIcon.png',
    5002: 'perk-images/StatMods/StatModsArmorIcon.png',
    5003: 'perk-images/StatMods/StatModsMagicResIcon.png',
    5005: 'perk-images/StatMods/StatModsAttackSpeedIcon.png',
    5007: 'perk-images/StatMods/StatModsCDRScalingIcon.png',
    5008: 'perk-images/StatMods/StatModsAdaptiveForceIcon.png',
  };
  static const String _versionUrl =
      'https://ddragon.leagueoflegends.com/api/versions.json';
  late final String _baseDataUrl;

  static const String _runeImgBaseUrl =
      'https://ddragon.leagueoflegends.com/cdn/img';

  String get _baseImgUrl {
    final ver = _version ?? 'latest';
    return 'https://ddragon.leagueoflegends.com/cdn/$ver/img';
  }

  Future<void> init() async {
    if (_version != null) return;
    final verRes = await _client.get(Uri.parse(_versionUrl));
    if (verRes.statusCode == 200) {
      final list = jsonDecode(verRes.body) as List<dynamic>;
      if (list.isNotEmpty) _version = list.first as String;
    }
    _baseDataUrl =
        'https://ddragon.leagueoflegends.com/cdn/$_version/data/en_US';
    final runesRes =
        await _client.get(Uri.parse('$_baseDataUrl/runesReforged.json'));
    if (runesRes.statusCode == 200) {
      final data = jsonDecode(runesRes.body) as List<dynamic>;
      for (final style in data) {
        final slots = style['slots'] as List<dynamic>;
        for (final slot in slots) {
          final runes = slot['runes'] as List<dynamic>;
          for (final rune in runes) {
            final id = rune['id'] as int;
            final icon = rune['icon'] as String;
            final name = rune['name'] as String? ?? '';
            _runeMap[id] = RuneDTO(id: id, name: name, icon: icon);
          }
        }
      }
    }
  }

  String championIcon(String championName) =>
      '$_baseImgUrl/champion/$championName.png';

  String profileIcon(int id) => '$_baseImgUrl/profileicon/$id.png';

  String itemIcon(int id) => '$_baseImgUrl/item/$id.png';

  String? summonerSpellIcon(int? id) {
    const Map<int, String> spellMap = {
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
    final name = spellMap[id];
    if (name == null) return null;
    return '$_baseImgUrl/spell/$name.png';
  }

  String? runeIcon(int id) {
    final iconPath = _runeMap[id]?.icon ?? _shardIcon[id];
    if (iconPath == null) return null;
    return '$_runeImgBaseUrl/$iconPath';
  }

  String? runeName(int id) => _runeMap[id]?.name;

  void dispose() => _client.close();
}
