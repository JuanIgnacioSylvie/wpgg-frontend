import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/profile_account.dto.dart';
import 'package:wpgg/models/match_summary.dto.dart';
import 'package:wpgg/models/player_rank.dto.dart';
import 'package:wpgg/models/stats.dto.dart';
import 'package:wpgg/models/gameplay_recommendation.dto.dart';
import 'package:wpgg/services/riot_api_service.dart';
import 'package:wpgg/services/secure_storage_service.dart';
import 'package:wpgg/ui/common/widgets/snackbar_bar.dart';

class ProfileViewModel extends BaseViewModel {
  final _riot = locator<RiotApiService>();
  final _secure = locator<SecureStorageService>();

  double loadingProgress = 0;

  ProfileAccountDTO? profile;
  List<MatchSummaryDTO> matches = [];
  PlayerRankDTO? ranks;
  StatsDTO? stats;
  GameplayRecommendationDTO? recommendation;

  Future<void> loadData() async {
    setBusy(true);
    loadingProgress = 0;
    final _snackbar = locator<SnackbarService>();
    const totalSteps = 5;
    double step = 1 / totalSteps;
    try {
      final puuid = await _secure.read('last_puuid');
      if (puuid != null) {
        profile = await _riot.fetchProfileAccount(puuid);
        loadingProgress += step;
        notifyListeners();
        matches = await _riot.fetchMatches(puuid);
        loadingProgress += step;
        notifyListeners();
        ranks = await _riot.fetchRanks(puuid);
        loadingProgress += step;
        notifyListeners();
        stats = await _riot.fetchStats(puuid);
        loadingProgress += step;
        notifyListeners();
        if (stats != null) {
          recommendation = await _riot.fetchRecommendation(stats!);
        }
        loadingProgress = 1;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('$e');
      _snackbar.showCustomSnackBar(
        variant: SnackbarType.error,
        message: 'Error loading profile data',
      );
    } finally {
      setBusy(false);
    }
  }
}
