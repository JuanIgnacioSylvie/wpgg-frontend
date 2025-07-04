import 'package:json_annotation/json_annotation.dart';

part 'summoner_spells.dto.g.dart';

@JsonSerializable()
class SummonerSpellsDTO {
  SummonerSpellsDTO({
    this.summoner1Id,
    this.summoner2Id,
    this.summoner1Casts,
    this.summoner2Casts,
  });

  int? summoner1Id;
  int? summoner2Id;
  int? summoner1Casts;
  int? summoner2Casts;

  factory SummonerSpellsDTO.fromJson(Map<String, dynamic> json) =>
      _$SummonerSpellsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SummonerSpellsDTOToJson(this);
}
