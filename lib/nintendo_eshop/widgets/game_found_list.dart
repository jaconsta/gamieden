import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamieden/nintendo_eshop/cubit/add_game_cubit.dart';
import 'package:nintendo_eshop_repository/nintendo_eshop_repository.dart';

class GameFoundList extends StatelessWidget {
  final List<NintendoGame> games;
  const GameFoundList({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleBackground = theme.colorScheme.primary;

    if (games.isEmpty) {
      return Center(child: Text("No games found."));
    }

    return SafeArea(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Card(
            color: theme.colorScheme.surface,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    CachedNetworkImage(
                      imageUrl: game.bannerImage,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          stops: const [0.25, 0.7, 1],
                          colors: [
                            titleBackground.withAlpha(200),
                            titleBackground.withAlpha(100),
                            titleBackground.withAlpha(0),
                          ],
                        ),
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Text(
                      game.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(game.currentPrice, style: theme.textTheme.bodyLarge),
                    SizedBox(width: 20, height: 50),
                    if (game.discountPercent > 0) ...[
                      Chip(
                        label: Text(
                          "${game.discountPercent} %",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text('Add'),
                      onPressed: () {
                        context.read<AddGameCubit>().addGame(game);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
