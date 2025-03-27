import "package:beamer/beamer.dart";
import "package:flutter/material.dart";
import "package:gamieden/game/view/game_list_page.dart";
import "package:gamieden/nintendo_eshop/view/view.dart" as nintendoeshop;
import "package:gamieden/steamstore/view/view.dart" as steamstore;

final routerDelegate = BeamerDelegate(
  locationBuilder:
      RoutesLocationBuilder(
        routes: {
          "/": (context, state, data) => GameListPage(),
          "/nintendo/add":
              (context, state, data) => nintendoeshop.NintendoGameAddPage(),
          "/nintendo/search": (context, state, data) {
            final params = data as Map<String, String>;
            final name = params["name"]!;
            return BeamPage(
              key: ValueKey("nintendo-search-by-name"),
              title: "Nintendo search $name",
              popToNamed: "/",
              type: BeamPageType.slideTransition,
              child: nintendoeshop.SearchGameList(nameQuery: name),
            );
          },
          "/steamstore/add": (context, state, data) => steamstore.GameAddPage(),
          "/steamstore/game/:gameId": (context, state, data) {
            final gameId = state.pathParameters["gameId"]!;

            return BeamPage(
              key: ValueKey("steamstore-$gameId"),
              title: "Steam game Id $gameId",
              popToNamed: "/",
              type: BeamPageType.slideTransition,
              child: steamstore.GameSummaryPage(gameId),
            );
          },
        },
      ).call,
  initialPath: "/",
);

final routerParser = BeamerParser();

final backButtonDispatcher = BeamerBackButtonDispatcher(
  delegate: routerDelegate,
);
