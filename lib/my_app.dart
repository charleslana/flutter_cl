import 'package:flutter/material.dart';
import 'package:flutter_cl/controllers/theme_controller.dart';
import 'package:flutter_cl/routes.dart';
import 'package:flutter_cl/theme.dart';
import 'package:get/get.dart';
// import 'package:flutter_cl/services/theme_service.dart';
// import 'package:watch_it/watch_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeService = watchIt<ThemeService>()..loadThemeMode();
    ThemeController.to.loadThemeMode();

    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'My app',
      // theme: ThemeData(
      //   primarySwatch: Colors.amber,
      //   brightness: Brightness.dark,
      // ),
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
