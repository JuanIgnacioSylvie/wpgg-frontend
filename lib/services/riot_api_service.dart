// lib/services/riot_api_service.dart
import 'package:wpgg/models/account.dto.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/models/profile_account.dto.dart';
import 'package:wpgg/models/player_rank.dto.dart';
import 'package:wpgg/models/stats.dto.dart';
import 'package:wpgg/models/gameplay_recommendation.dto.dart';
import '../app/app.locator.dart';
import 'backend_api_service.dart';
import 'secure_storage_service.dart';

class RiotApiService {
  RiotApiService()
      : _api = locator<BackendApiService>(),
        _secure = locator<SecureStorageService>();

  final BackendApiService _api;
  final SecureStorageService _secure;

  static const _base = 'api/riot';

  // ---------- Account -------------------------------------------------------

  Future<AccountDTO> fetchAccount(String puuid) async {
    const prefix = 'account_';
    final cacheKey = '$prefix$puuid';

    // 1. ¿Hay dato en caché segura?
    final cached = await _secure.readJson(cacheKey);
    if (cached != null) {
      return AccountDTO.fromJson(cached as Map<String, dynamic>);
    }

    // 2. Llamada a backend
    final data =
        await _api.get('$_base/account/$puuid') as Map<String, dynamic>;

    // 3. Guardo la respuesta en secure storage
    await _secure.writeJson(cacheKey, data);

    return AccountDTO.fromJson(data);
  }

  // ---------- Account por Riot ID ------------------------------------------

  Future<AccountDTO> fetchAccountByRiotId(
      String gameName, String tagLine) async {
    final cacheKey = 'account_${gameName}_$tagLine';

    final cached = await _secure.readJson(cacheKey);
    if (cached != null) {
      return AccountDTO.fromJson(cached as Map<String, dynamic>);
    }

    final data = await _api.get('$_base/profile/$gameName/$tagLine')
        as Map<String, dynamic>;

    await _secure.writeJson(cacheKey, data);
    return AccountDTO.fromJson(data);
  }

  // ---------- ProfileAccount -----------------------------------------------

  Future<ProfileAccountDTO> fetchProfileAccount(String puuid) async {
    final cacheKey = 'profile_$puuid';

    final cached = await _secure.readJson(cacheKey);
    if (cached != null) {
      return ProfileAccountDTO.fromJson(cached as Map<String, dynamic>);
    }

    final data =
        await _api.get('$_base/profile-account/$puuid') as Map<String, dynamic>;

    await _secure.writeJson(cacheKey, data);
    return ProfileAccountDTO.fromJson(data);
  }

  // ---------- Matches -------------------------------------------------------

  Future<List<MatchSummaryDTO>> fetchMatches(String puuid) async {
    final cacheKey = 'matches_$puuid';

    final cached = await _secure.readJson(cacheKey);
    if (cached != null) {
      return (cached as List<dynamic>)
          .map((e) => MatchSummaryDTO.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    final list = await _api.get('$_base/matches/$puuid') as List<dynamic>;

    await _secure.writeJson(cacheKey, list);
    return list
        .map((e) => MatchSummaryDTO.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ---------- Stats --------------------------------------------------------

  Future<StatsDTO> fetchStats(String puuid) async {
    final cacheKey = 'stats_$puuid';

    final cached = await _secure.readJson(cacheKey);
    if (cached != null) {
      return StatsDTO.fromJson(cached as Map<String, dynamic>);
    }

    final data = await _api.get('$_base/stats/$puuid') as Map<String, dynamic>;

    await _secure.writeJson(cacheKey, data);
    return StatsDTO.fromJson(data);
  }

  // ---------- Ranks --------------------------------------------------------

  Future<PlayerRankDTO> fetchRanks(String puuid) async {
    final cacheKey = 'ranks_$puuid';

    final cached = await _secure.readJson(cacheKey);
    if (cached != null) {
      return PlayerRankDTO.fromJson(cached as Map<String, dynamic>);
    }

    final data = await _api.get('$_base/ranks/$puuid') as Map<String, dynamic>;

    await _secure.writeJson(cacheKey, data);
    return PlayerRankDTO.fromJson(data);
  }

  // ---------- Gemini Recommendation ---------------------------------------

  Future<GameplayRecommendationDTO> fetchRecommendation(StatsDTO stats) async {
    final data = await _api.post('api/gemini/recommend', payload: {
      'stats': stats.toJson(),
    }) as Map<String, dynamic>;

    return GameplayRecommendationDTO.fromJson(data);
  }
}
