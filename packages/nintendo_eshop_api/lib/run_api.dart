import 'package:nintendo_eshop_api/nintendo_eshop_api.dart';

Future<void> main() async {
  final nindo = NintendoEshopApiClient();
  final foundGames = await nindo.gameSearch("Moonlighter");

  for (final game in foundGames) {
    print(
      "${game.name}: ids:(${game.nsuIds.join(", ")}) price: ${game.priceRegular}",
    );
  }
}

