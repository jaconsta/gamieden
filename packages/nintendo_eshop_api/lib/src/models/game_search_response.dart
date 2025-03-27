import 'package:json_annotation/json_annotation.dart';
import 'package:nintendo_eshop_api/nintendo_eshop_api.dart';

part 'game_search_response.g.dart';

@JsonSerializable()
class GameSearchResponse {
  @JsonKey(name: "numFound")
  final int numFound;
  final int start;
  @JsonKey(name: "numFoundExact")
  final bool numFoundExact; // Npi what this means
  final List<GameSearchDetails> docs;

  GameSearchResponse({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.docs,
  });

  factory GameSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$GameSearchResponseFromJson(json);

  List<GameSearchDetails> get games {
    return docs;
  }
}
