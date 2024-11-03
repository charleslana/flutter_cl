import 'package:flutter/material.dart';
import 'package:flutter_cl/controllers/theme_controller.dart';
import 'package:flutter_cl/enum/app_route.dart';
import 'package:flutter_cl/providers.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController controller = ThemeController.to;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            Text('Main title'),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem<dynamic>(
                child: ListTile(
                  leading: Obx(() => controller.isDarkMode
                      ? const Icon(Icons.brightness_7)
                      : const Icon(Icons.brightness_2)),
                  title: Obx(() => controller.isDarkMode
                      ? const Text('Light')
                      : const Text('Dark')),
                  onTap: controller.toggleThemeMode,
                ),
              ),
              PopupMenuItem<dynamic>(
                  child: ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Sair'),
                onTap: () {
                  Navigator.pop(context);
                  getIt<AuthService>().logout();
                },
              )),
            ],
          ),
        ],
      ),
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
            TextButton(
              onPressed: () => context.push(AppRoute.language.path),
              child: const Text('Language page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.pageview.path),
              child: const Text('Pageview page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.floating.path),
              child: const Text('Floating page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.form.path),
              child: const Text('Form page'),
            ),
            TextButton(
              onPressed: () => context.push(AppRoute.mock.path),
              child: const Text('Mock page'),
            ),
            OutlinedButton(
              onPressed: () => getIt<AuthService>().logout(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
