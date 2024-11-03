import 'package:hive_flutter/hive_flutter.dart';

Future<void> setupHive() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen('game_cache')) {
    await Hive.openBox<String>('game_cache');
  }
  if (!Hive.isBoxOpen('shared_preferences')) {
    await Hive.openBox<String>('shared_preferences');
  }
}