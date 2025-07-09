import 'package:json_annotation/json_annotation.dart';

part 'summary_stats.dto.g.dart';

@JsonSerializable()
class SummaryStatsDTO {
  SummaryStatsDTO({this.totalGames, this.wins, this.losses, this.winRate});

  int? totalGames;
  int? wins;
  int? losses;
  double? winRate;

  factory SummaryStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$SummaryStatsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryStatsDTOToJson(this);
}
