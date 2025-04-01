import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamieden/shared_widgets/game_populated_background.dart';
import 'package:gamieden/steamstore/cubit/add_game_cubit.dart';
import 'package:gamieden/steamstore/models/models.dart';
import 'package:gamieden/steamstore/widgets/price.dart';

class GamePopulated extends StatelessWidget {
  final SteamGame game;
  final ValueGetter<Future<void>> onRefresh;

  const GamePopulated({super.key, required this.game, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = Theme.of(context).colorScheme.primaryContainer;
    return SafeArea(
      child: Stack(
        children: [
          GamePopulatedBackground(color: color),
          RefreshIndicator(
            onRefresh: onRefresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              child: Column(
                children: [
                  Container(
                    color: theme.colorScheme.surface,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    child: FittedBox(
                      child: CachedNetworkImage(
                        imageUrl: game.coverImage,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: theme.colorScheme.primary,
                            height: 20.0,
                            thickness: 3.0,
                            endIndent: 20.0,
                            indent: 20.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            game.name,
                            style: theme.textTheme.headlineMedium!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: theme.colorScheme.primary,
                            height: 20.0,
                            thickness: 3.0,
                            indent: 20.0,
                            endIndent: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Price(
                    fullPrice: game.fullPrice,
                    currentPrice: game.currentPrice ?? "0 €",
                    discountPercent: game.discountPercent,
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    context.read<AddGameCubit>().removeGame(game);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 8.0,
                    ),
                    child: Text("Remove Game"),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    context.read<AddGameCubit>().addGame(game);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 8.0,
                    ),
                    child: Text("Add Game"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
