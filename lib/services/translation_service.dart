import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class TranslationService extends ChangeNotifier {
  TranslationService() {
    print('TranslationService initialized');
  }

  Locale _locale = const Locale('en');
  Map<String, String> _translations = {};

  Locale get locale => _locale;

  Future<void> _loadTranslations() async {
    String jsonString;
    try {
      jsonString = await rootBundle
          .loadString('assets/translations/${_locale.languageCode}.json');
    } catch (e) {
      _locale = const Locale('en');
      jsonString = await rootBundle.loadString('assets/translations/en.json');
    }
    _translations = Map<String, String>.from(json.decode(jsonString));
    notifyListeners();
  }

  void setLocale(Locale locale) async {
    if (locale == _locale) return;
    _locale = locale;
    await _loadTranslations();
    notifyListeners();
  }

  Future<void> detectSystemLocale() async {
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
    if (systemLocale.languageCode == 'pt' ||
        systemLocale.languageCode == 'en') {
      _locale = systemLocale;
    } else {
      _locale = const Locale('en');
    }
    await _loadTranslations();
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }
}
