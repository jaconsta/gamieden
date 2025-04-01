import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_api/games_api.dart' as game_api;
import 'package:gamieden/nintendo_eshop/cubit/game_summary_cubit.dart';
import 'package:gamieden/nintendo_eshop/widgets/price.dart' as nintendo_price;
import 'package:gamieden/shared_widgets/game_populated_background.dart';

class GameSummaryPopulated extends StatelessWidget {
  final game_api.GameApi game;

  const GameSummaryPopulated({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    if (game.source == game_api.GameSource.none) {
      return Center(child: Text("no Game"));
    }

    final theme = Theme.of(context);
    final color = Theme.of(context).colorScheme.primaryContainer;
    final shouldNameClip = game.summary.name.length < 20;
    return SafeArea(
      child: Stack(
        children: [
          GamePopulatedBackground(color: color),
          SingleChildScrollView(
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
                      imageUrl: game.summary.coverUrl,
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
                  child:
                      (shouldNameClip)
                          ? Row(
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
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: Text(
                                  game.summary.name,
                                  style: theme.textTheme.headlineMedium!
                                      .copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                              ),
                              if (shouldNameClip)
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
                          )
                          : Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              game.summary.name,
                              style: theme.textTheme.headlineMedium!.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                ),
                SizedBox(height: 20),
                nintendo_price.Price(
                  fullPrice: game.price.fullPrice,
                  currentPrice: game.price.currentPrice,
                  discountPercent:
                      int.tryParse(game.price.discountPercent) ?? 0,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: () {
                context.read<GameSummaryCubit>().deleteGame();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                child: Text("Remove Game"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
