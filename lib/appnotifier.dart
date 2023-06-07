import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkThemeEnabled = false;

  bool get isDarkThemeEnabled => _isDarkThemeEnabled;

  void toggleTheme() {
    _isDarkThemeEnabled = !_isDarkThemeEnabled;
    notifyListeners();
  }
}
