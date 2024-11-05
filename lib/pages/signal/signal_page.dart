import 'package:flutter/material.dart';
import 'package:flutter_cl/controllers/login_controller.dart';
import 'package:flutter_cl/enum/app_route.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

class SignalPage extends StatefulWidget {
  const SignalPage({super.key});

  @override
  State<SignalPage> createState() => _SignalPageState();
}

class _SignalPageState extends State<SignalPage> {
  final _controller = LoginController();
  late final void Function() disposer;

  @override
  void initState() {
    super.initState();
    effect(() {
      debugPrint(_controller.user()?.name);
    });

    disposer = effect(() {
      if (_controller.isLoggedIn()) {
        context.push(AppRoute.logout.path, extra: _controller);
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signal title'),
      ),
      body: Center(
        child: Watch(
          (_) => _controller.loading.value
              ? const CircularProgressIndicator()
              : FilledButton(
                  onPressed: _controller.login,
                  child: const Text('Login'),
                ),
        ),
      ),
    );
  }
}
