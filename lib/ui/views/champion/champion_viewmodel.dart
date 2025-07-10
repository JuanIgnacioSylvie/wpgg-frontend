import 'package:stacked/stacked.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/models/champion_global_stats.dto.dart';
import 'package:wpgg/services/riot_api_service.dart';

class ChampionViewModel extends BaseViewModel {
  final _riot = locator<RiotApiService>();

  final String championName;
  ChampionViewModel(this.championName);

  ChampionGlobalStatsDTO? stats;

  Future<void> loadData() async {
    setBusy(true);
    try {
      stats = await _riot.fetchChampionGlobalStats(championName);
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }
}
