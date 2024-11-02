import 'package:flutter/material.dart';
import 'package:flutter_cl/my_app.dart';
import 'package:flutter_cl/providers.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('pt_BR', timeago.PtBrShortMessages());
  await Hive.initFlutter();
  if (!Hive.isBoxOpen('game_cache')) {
    await Hive.openBox<String>('game_cache');
  }
  setupProviders();
  await getIt<TranslationService>().detectSystemLocale();
  runApp(const MyApp());
}
