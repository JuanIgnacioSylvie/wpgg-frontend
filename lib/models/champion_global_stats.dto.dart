import 'package:json_annotation/json_annotation.dart';
import 'build.dto.dart';
import 'runes.dto.dart';
import 'summoner_spells.dto.dart';
import 'role_stats.dto.dart';

part 'champion_global_stats.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ChampionGlobalStatsDTO {
  ChampionGlobalStatsDTO({
    this.championName,
    this.gamesPlayed,
    this.wins,
    this.winRate,
    this.bestBuild,
    this.bestRunes,
    this.bestSpells,
    this.bestSkillOrder,
    this.roles,
  });

  String? championName;
  int? gamesPlayed;
  int? wins;
  double? winRate;
  BuildDTO? bestBuild;
  RunesDTO? bestRunes;
  SummonerSpellsDTO? bestSpells;
  List<int>? bestSkillOrder;
  List<RoleStatsDTO>? roles;

  factory ChampionGlobalStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$ChampionGlobalStatsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionGlobalStatsDTOToJson(this);
}
