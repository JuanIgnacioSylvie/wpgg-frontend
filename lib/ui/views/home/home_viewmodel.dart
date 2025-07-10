import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:stacked_services/stacked_services.dart';
import 'package:wpgg/app/app.locator.dart';
import 'package:wpgg/services/riot_api_service.dart';
import 'package:wpgg/services/secure_storage_service.dart';
import 'package:wpgg/ui/common/widgets/snackbar_bar.dart';

class HomeViewModel extends BaseViewModel {
  final gameController = TextEditingController();
  final tagController = TextEditingController();
  final championController = TextEditingController();

  final RiotApiService _riot = locator<RiotApiService>();
  final NavigationService _nav = locator<NavigationService>();
  final SecureStorageService _secure = locator<SecureStorageService>();
  final SnackbarService _snackbar = locator<SnackbarService>();

  Future<void> search() async {
    setBusy(true);
    try {
      final account = await _riot.fetchAccountByRiotId(
        gameController.text,
        tagController.text,
      );
      await _secure.write('last_puuid', account.puuid);
      await _nav
          .navigateTo('/profile/${gameController.text}-${tagController.text}');
    } catch (e) {
      debugPrint('$e');
      var message = e.toString();
      final match = RegExp(r'\{.*\}').firstMatch(message);
      if (match != null) {
        try {
          final decoded = jsonDecode(match.group(0)!);
          if (decoded is Map<String, dynamic> && decoded['error'] != null) {
            message = decoded['error'] as String;
          }
        } catch (_) {}
      }
      _snackbar.showCustomSnackBar(
        variant: SnackbarType.error,
        message: message,
      );
    } finally {
      setBusy(false);
    }
  }

  Future<void> searchChampion() async {
    setBusy(true);
    try {
      final puuid = await _secure.read('last_puuid');
      if (puuid == null) {
        _snackbar.showCustomSnackBar(
          variant: SnackbarType.error,
          message: 'No summoner selected',
        );
        return;
      }
      await _nav.navigateToChampionView(
        championName: championController.text,
      );
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    gameController.dispose();
    tagController.dispose();
    championController.dispose();
    super.dispose();
  }
}
