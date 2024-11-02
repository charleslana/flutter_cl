import 'package:flutter/material.dart';
import 'package:flutter_cl/enum/app_route.dart';
import 'package:flutter_cl/models/game.dart';
import 'package:flutter_cl/repositories/game_repository.dart';
import 'package:flutter_cl/widgets/game_image_card.dart';
import 'package:flutter_cl/widgets/games_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:watch_it/watch_it.dart';

class GamePage extends StatefulWidget with WatchItStatefulWidgetMixin {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void openDetails(Game game) {
    context.push(AppRoute.gameDetail.path, extra: game);
  }

  @override
  Widget build(BuildContext context) {
    final GameRepository gameRepository = watchIt<GameRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Games'),
      ),
      body: gameRepository.games.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GamesGridView(
              games: List.from(
                gameRepository.games.map(
                  (Game game) => GameImageCard(
                    game: game,
                    onTap: () => openDetails(game),
                  ),
                ),
              ),
            ),
    );
  }
}
