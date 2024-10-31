import 'package:flutter/material.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final translationService = context.watch<TranslationService>();

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
