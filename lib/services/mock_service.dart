import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_cl/models/game.dart';

class MockService {
  Future<List<Game>> loadGames() async {
    await Future.delayed(const Duration(seconds: 2), () => null);
    final String jsonString = await loadJson();
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((gameMap) => Game.fromMap(gameMap)).toList();
  }

  Future<String> loadJson() async {
    return rootBundle.loadString('assets/json/mock.json');
  }
}
