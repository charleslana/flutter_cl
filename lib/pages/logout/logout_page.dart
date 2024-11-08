import 'package:flutter/material.dart';
import 'package:flutter_cl/controllers/login_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key, required this.controller});

  final LoginController controller;

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> with SignalsMixin {
  @override
  void initState() {
    effect(() {
      if (!widget.controller.isLoggedIn() && mounted) {
        context.pop();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: widget.controller.logout,
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
