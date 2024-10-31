import 'package:flutter/material.dart';
import 'package:flutter_cl/my_app.dart';
import 'package:flutter_cl/providers.dart';
import 'package:flutter_cl/services/translation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupProviders();
  await getIt<TranslationService>().detectSystemLocale();
  runApp(const MyApp());
}
