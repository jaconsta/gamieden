import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamieden/steamstore/cubit/add_game_cubit.dart';
import 'package:gamieden/steamstore/models/models.dart';

class GamePopulated extends StatelessWidget {
  final SteamGame game;
  final ValueGetter<Future<void>> onRefresh;

  const GamePopulated({super.key, required this.game, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Stack(
        children: [
          _GamePopulatedBackground(),
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
            child: FilledButton(
              onPressed: () {
                context.read<AddGameCubit>().addGame(game);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                child: Text("Add Game"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GamePopulatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primaryContainer;
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.25, 0.75, 0.90, 1.0],
            colors: [
              color,
              color.brighten(),
              color.brighten(33),
              color.brighten(50),
            ],
          ),
        ),
      ),
    );
  }
}

extension on Color {
  Color brighten([int percent = 10]) {
    assert(
      1 <= percent && percent <= 100,
      'percentage must be between 1 and 100',
    );
    final p = percent / 100;
    final alpha = a.round();
    final red = r.round();
    final green = g.round();
    final blue = b.round();
    return Color.fromARGB(
      alpha,
      red + ((255 - red) * p).round(),
      green + ((255 - green) * p).round(),
      blue + ((255 - blue) * p).round(),
    );
  }
}

class Price extends StatelessWidget {
  final String fullPrice;
  final String currentPrice;
  final int discountPercent;

  const Price({
    super.key,
    required this.fullPrice,
    required this.currentPrice,
    required this.discountPercent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    if (discountPercent == 0) {
      return Container(
        margin: EdgeInsets.only(left: 50),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        width: width,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              currentPrice,
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(
        left: 50 + (((discountPercent / 100)) * (width / 3)),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      width: width,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            currentPrice,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                fullPrice,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                " (- $discountPercent %)",
                style: theme.textTheme.titleSmall!.copyWith(
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
