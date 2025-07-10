import 'package:stacked/stacked.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/champion_detailed_stats.dto.dart';
import 'package:wpgg/services/riot_api_service.dart';
import 'package:wpgg/services/secure_storage_service.dart';

class ChampionViewModel extends BaseViewModel {
  final _riot = locator<RiotApiService>();
  final _secure = locator<SecureStorageService>();

  final String championName;
  ChampionViewModel(this.championName);

  ChampionDetailedStatsDTO? stats;

  Future<void> loadData() async {
    setBusy(true);
    try {
      final puuid = await _secure.read('last_puuid');
      if (puuid != null) {
        stats = await _riot.fetchChampionStats(puuid, championName);
        notifyListeners();
      }
    } finally {
      setBusy(false);
    }
  }
}
