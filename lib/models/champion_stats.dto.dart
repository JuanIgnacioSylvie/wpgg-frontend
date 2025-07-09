import 'package:json_annotation/json_annotation.dart';

part 'champion_stats.dto.g.dart';

@JsonSerializable()
class ChampionStatsDTO {
  ChampionStatsDTO(
      {this.championName, this.gamesPlayed, this.wins, this.winRate});

  String? championName;
  int? gamesPlayed;
  int? wins;
  double? winRate;

  factory ChampionStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$ChampionStatsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ChampionStatsDTOToJson(this);
}
