import 'package:flutter/material.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final translationService = context.watch<TranslationService>();

    return Scaffold(
      appBar: AppBar(
        title: Text(translationService.translate('hello')),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () => context.read<AuthService>().login(),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
