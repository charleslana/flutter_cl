import 'package:flutter/material.dart';
import 'package:flutter_cl/theme.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  final RxBool _isDarkMode = false.obs;

  // ThemeData _themeData = lightTheme;

  bool get isDarkMode => _isDarkMode.value;

  // ThemeData get themeData => _themeData;

  void toggleThemeMode() {
    // _isDarkMode.value = !_isDarkMode.value;
    // _themeData = _isDarkMode.value ? darkTheme : lightTheme;
    // _write(_isDarkMode.value ? 'dark' : 'light');
    // Get.changeTheme(_themeData);
    if (_isDarkMode.value) {
      _setLightMode();
      return;
    }
    _setDarkMode();
  }

  void loadThemeMode() {
    final themeText = _read();
    if (themeText == 'light') {
      _setLightMode();
      return;
    }
    if (themeText == 'dark') {
      _setDarkMode();
      return;
    }
    Get.changeThemeMode(ThemeMode.system);
  }

  void _setLightMode() {
    _isDarkMode.value = false;
    _write('light');
    Get
      ..changeTheme(lightTheme)
      ..changeThemeMode(ThemeMode.light);
  }

  void _setDarkMode() {
    _isDarkMode.value = true;
    _write('dark');
    Get
      ..changeTheme(darkTheme)
      ..changeThemeMode(ThemeMode.dark);
  }

  String _read() {
    final Box<String> sharedPreferences = Hive.box('shared_preferences');
    return sharedPreferences.get('theme') ?? '';
  }

  void _write(String themeText) {
    Hive.box<String>('shared_preferences').put('theme', themeText);
  }
}
