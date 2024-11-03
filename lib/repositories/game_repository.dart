import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cl/cache/game_cache.dart';
import 'package:flutter_cl/constants.dart';
import 'package:flutter_cl/models/comment.dart';
import 'package:flutter_cl/models/game.dart';

import 'package:http/http.dart' as http;

class GameRepository extends ChangeNotifier {
  GameRepository() {
    loadGames();
  }

  final List<Game> _games = [];

  UnmodifiableListView<Game> get games => UnmodifiableListView<Game>(_games);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> addComment(Game game, Comment comment) async {
    final url = Uri.parse('$baseUrlApi/games/${game.id}/comments');
    final response = await http.post(url, body: {
      'gameId': game.id.toString(),
      'text': comment.text,
      'date': comment.date.toString(),
    });
    if (response.statusCode == 201) {
      game.comments.add(comment);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> loadGames() async {
    _isLoading = true;
    try {
      const url = '$baseUrlApi/games';
      final cache = GameCache();
      _loadCache(cache, url);
      await _syncWithGameApi(url, cache, _addToGameList);
      await _syncWithCommentsApi();
      notifyListeners();
    } on HttpException catch (error) {
      debugPrint('Erro ao conectar a API: $error');
    } on TimeoutException {
      debugPrint('Timeout excedido ao conectar a API!');
    } finally {
      _isLoading = false;
    }
  }

  void _addToGameList(dynamic gameList) {
    _games.removeRange(0, _games.length);
    for (final gameItem in gameList) {
      final game = Game.fromMap(gameItem);
      _games.add(game);
    }
    // notifyListeners();
  }

  Future<void> _convertResponse(
      String response, void Function(dynamic) processResponse) async {
    final resp = jsonDecode(response) as List;
    processResponse(resp);
  }

  Future<void> _syncWithGameApi(String url, GameCache cache,
      void Function(dynamic) processResponse) async {
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      // final response = resp.body;
      final response = utf8.decode(resp.bodyBytes);
      cache.write(url, response);
      await _convertResponse(response, processResponse);
    }
  }

  void _loadCache(GameCache cache, String url) {
    String response = cache.read(url);
    if (response.isNotEmpty) {
      _convertResponse(response, _addToGameList);
    }
    for (final game in _games) {
      final buffer = StringBuffer()
        ..write(url)
        ..write('/')
        ..write(game.id)
        ..write('/comments');
      final composedUrl = buffer.toString();
      response = cache.read(composedUrl);
      if (response.isNotEmpty) {
        _convertResponse(
            response, (response) => _addToGameComments(game, response));
      }
    }
    notifyListeners();
  }

  void _addToGameComments(Game game, List<dynamic> comments) {
    game.comments = [];
    for (final comment in comments) {
      game.comments.add(
        Comment(
          text: comment['text'] as String,
          date: DateTime.parse(comment['date']),
        ),
      );
      // notifyListeners();
    }
  }

  Future<void> _syncWithCommentsApi() async {
    final List<Future<http.Response>> futureComments = [];
    for (final game in _games) {
      final String url = '$baseUrlApi/games/${game.id}/comments';
      futureComments.add(http.get(Uri.parse(url)));
    }
    final List<http.Response> results = await Future.wait(futureComments);
    for (var i = 0; i < results.length; i++) {
      final resp = results[i];
      if (resp.statusCode == 200) {
        // final response = resp.body;
        final response = utf8.decode(resp.bodyBytes);
        GameCache().write(resp.request!.url.toString(), response);
        await _convertResponse(
            response, (response) => _addToGameComments(_games[i], response));
      }
    }
    // notifyListeners();
  }
}
