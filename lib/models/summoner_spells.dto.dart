import 'package:json_annotation/json_annotation.dart';

part 'summoner_spells.dto.g.dart';

@JsonSerializable()
class SummonerSpellsDTO {
  SummonerSpellsDTO({
    required this.summoner1Id,
    required this.summoner2Id,
    required this.summoner1Casts,
    required this.summoner2Casts,
  });

  int summoner1Id;
  int summoner2Id;
  int summoner1Casts;
  int summoner2Casts;

  factory SummonerSpellsDTO.fromJson(Map<String, dynamic> json) =>
      _$SummonerSpellsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SummonerSpellsDTOToJson(this);
}
