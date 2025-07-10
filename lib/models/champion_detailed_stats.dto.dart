import 'package:json_annotation/json_annotation.dart';
import 'build.dto.dart';
import 'runes.dto.dart';

part 'champion_detailed_stats.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ChampionDetailedStatsDTO {
  ChampionDetailedStatsDTO({
    this.championName,
    this.gamesPlayed,
    this.wins,
    this.winRate,
    this.bestBuild,
    this.bestRunes,
  });

  String? championName;
  int? gamesPlayed;
  int? wins;
  double? winRate;
  BuildDTO? bestBuild;
  RunesDTO? bestRunes;

  factory ChampionDetailedStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$ChampionDetailedStatsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionDetailedStatsDTOToJson(this);
}
