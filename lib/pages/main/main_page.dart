import 'package:flutter/material.dart';
import 'package:flutter_cl/enum/app_route.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () => context.push(AppRoute.home.path),
              child: const Text('Home page'),
            ),
            OutlinedButton(
              onPressed: () => context.push(AppRoute.blank.path),
              child: const Text('Blank page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.fullscreen.path),
              child: const Text('Fullscreen page'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/none'),
              child: const Text('None page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.fade.path),
              child: const Text('Fade transition page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.scale.path),
              child: const Text('Scale transition page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.slide.path),
              child: const Text('Slide transition page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.rotation.path),
              child: const Text('Rotation transition page'),
            ),
            TextButton(
              onPressed: () => context.push('${AppRoute.detail.path}/1'),
              child: const Text('Detail page'),
            ),
            OutlinedButton(
              onPressed: () => context.read<AuthService>().logout(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}