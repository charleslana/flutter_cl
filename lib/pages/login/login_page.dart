import 'package:flutter/material.dart';
import 'package:flutter_cl/providers.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:flutter_cl/services/translation_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final translationService = getIt<TranslationService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('hello')),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () => getIt<AuthService>().login(),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
