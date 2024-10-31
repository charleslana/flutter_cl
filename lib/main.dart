import 'package:flutter/material.dart';
import 'package:flutter_cl/my_app.dart';
import 'package:flutter_cl/routes.dart';
import 'package:flutter_cl/services/auth_service.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>.value(value: authService),
        ChangeNotifierProvider(create: (_) => TranslationService()),
      ],
      child: const MyApp(),
    ),
  );
}
