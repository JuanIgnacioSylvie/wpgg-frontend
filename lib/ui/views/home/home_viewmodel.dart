import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/app/app.router.dart';
import 'package:wpgg/services/riot_api_service.dart';
import 'package:wpgg/services/secure_storage_service.dart';

class HomeViewModel extends BaseViewModel {
  final gameController = TextEditingController();
  final tagController = TextEditingController();

  final RiotApiService _riot = locator<RiotApiService>();
  final NavigationService _nav = locator<NavigationService>();
  final SecureStorageService _secure = locator<SecureStorageService>();

  Future<void> search() async {
    setBusy(true);
    try {
      final account = await _riot.fetchAccountByRiotId(
        gameController.text,
        tagController.text,
      );
      await _secure.write('last_puuid', account.puuid);
      await _nav.navigateToProfileView();
    } catch (e) {
      debugPrint('$e');
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    gameController.dispose();
    tagController.dispose();
    super.dispose();
  }
}
