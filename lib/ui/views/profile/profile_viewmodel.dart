import 'package:stacked/stacked.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/profile_account.dto.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/models/player_rank.dto.dart';
import 'package:wpgg/models/stats.dto.dart';
import 'package:wpgg/models/gameplay_recommendation.dto.dart';
import 'package:wpgg/services/riot_api_service.dart';
import 'package:wpgg/services/secure_storage_service.dart';

class ProfileViewModel extends BaseViewModel {
  final _riot = locator<RiotApiService>();
  final _secure = locator<SecureStorageService>();

  ProfileAccountDTO? profile;
  List<MatchSummaryDTO> matches = [];
  PlayerRankDTO? ranks;
  StatsDTO? stats;
  GameplayRecommendationDTO? recommendation;

  Future<void> loadData() async {
    setBusy(true);
    final puuid = await _secure.read('last_puuid');
    if (puuid != null) {
      profile = await _riot.fetchProfileAccount(puuid);
      matches = await _riot.fetchMatches(puuid);
      ranks = await _riot.fetchRanks(puuid);
      stats = await _riot.fetchStats(puuid);
      if (stats != null) {
        recommendation = await _riot.fetchRecommendation(stats!);
      }
    }
    setBusy(false);
  }
}
