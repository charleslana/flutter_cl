import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cl/models/game.dart';

class GameImageCard extends StatelessWidget {
  const GameImageCard({
    super.key,
    required this.game,
    required this.onTap,
  });

  final Game game;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(10),
      child: Ink.image(
        image: CachedNetworkImageProvider(game.image),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withOpacity(.2),
          highlightColor: Colors.white.withOpacity(.3),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Container(
              alignment: Alignment.topRight,
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Container(
                  width: 26,
                  height: 26,
                  alignment: Alignment.center,
                  color: Colors.black87,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1, left: 1),
                    child: Text(
                      '${game.comments.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
