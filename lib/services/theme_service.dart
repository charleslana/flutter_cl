import 'package:flutter/material.dart';
import 'package:flutter_cl/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeService extends ChangeNotifier {
  bool _isDarkMode = false;
  ThemeData _themeData = lightTheme;

  bool get isDarkMode => _isDarkMode;

  ThemeData get themeData => _themeData;

  void toggleThemeMode() {
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? darkTheme : lightTheme;
    _write(_isDarkMode ? 'dark' : 'light');
    notifyListeners();
  }

  void loadThemeMode() {
    final themeText = _read();
    if (themeText == 'light') {
      _isDarkMode = false;
      _themeData = lightTheme;
    } else if (themeText == 'dark') {
      _isDarkMode = true;
      _themeData = darkTheme;
    }
  }

  String _read() {
    final Box<String> sharedPreferences = Hive.box('shared_preferences');
    return sharedPreferences.get('theme') ?? '';
  }

  void _write(String themeText) {
    Hive.box<String>('shared_preferences').put('theme', themeText);
  }
}
