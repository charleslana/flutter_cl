import 'package:flutter/material.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:watch_it/watch_it.dart';

class LanguagePage extends StatelessWidget with WatchItMixin {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final translationService = watchIt<TranslationService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('welcome')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                translationService.setLocale(const Locale('en'));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                translationService.setLocale(const Locale('pt'));
              },
              child: const Text('Português'),
            ),
          ],
        ),
      ),
    );
  }
}
