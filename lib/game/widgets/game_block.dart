import 'package:beamer/beamer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:games_api/games_api.dart' as games_api;

class GameBlock extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final games_api.GameApi game;

  const GameBlock({
    super.key,
    required this.backgroundColor,
    required this.text,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.width / 2) - 6;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(3.0),
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: game.source.color.withValues(alpha: 0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 10), // changes position of shadow
              ),
            ],
          ),
        ),
        Center(
          child: CachedNetworkImage(
            imageUrl: game.summary.coverUrl,
            progressIndicatorBuilder:
                (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          margin: EdgeInsets.all(3.0),
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 13.0,
              horizontal: 12.0,
            ),
            child: Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: Text(text)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          game.price.currentPrice,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (game.price.discountPercent != "0")
                        Text("${game.price.discountPercent} %"),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Transform.rotate(
                          angle: 45,
                          child: IconButton(
                            onPressed: () {
                              Beamer.of(context).beamToNamed(
                                "/${game.source.urlDomain}/game/${game.sourceId}",
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll<Color>(
                                game.source.color.withValues(alpha: 0.2),
                              ),
                            ),
                            icon: Icon(Icons.arrow_upward),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
