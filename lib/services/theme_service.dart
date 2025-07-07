import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool _promptShown = false;

  ThemeMode get themeMode => _themeMode;
  bool get promptShown => _promptShown;

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void markPromptShown() {
    _promptShown = true;
  }
}
