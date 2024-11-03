import 'package:flutter/material.dart';
import 'package:flutter_cl/config.dart';
import 'package:flutter_cl/hive_data.dart';
import 'package:flutter_cl/my_app.dart';
import 'package:flutter_cl/providers.dart';
import 'package:flutter_cl/services/translation_service.dart';
import 'package:timeago/timeago.dart' as timeago;

Future<void> main() async {
  await initConfigurations();
  timeago.setLocaleMessages('pt_BR', timeago.PtBrShortMessages());
  await setupHive();
  setupProviders();
  await getIt<TranslationService>().detectSystemLocale();
  runApp(const MyApp());
}
