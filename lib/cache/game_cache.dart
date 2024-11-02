import 'package:hive_flutter/hive_flutter.dart';

class GameCache {
  factory GameCache() {
    return _instance;
  }

  GameCache._internal();

  factory GameCache.init() {
    return _instance;
  }

  static final _instance = GameCache._internal();

  String read(String url) {
    final Box<String> cache = Hive.box('game_cache');
    return cache.get(url) ?? '';
  }

  void write(String url, String data) {
    Hive.box<String>('game_cache').put(url, data);
  }
}
