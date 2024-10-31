import 'package:flutter/material.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login title'),
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
