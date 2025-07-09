import 'package:json_annotation/json_annotation.dart';
import 'champion_stats.dto.dart';
import 'role_stats.dto.dart';
import 'summary_stats.dto.dart';

part 'stats.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class StatsDTO {
  StatsDTO({this.summary, this.champions, this.roles});

  SummaryStatsDTO? summary;
  List<ChampionStatsDTO>? champions;
  List<RoleStatsDTO>? roles;

  factory StatsDTO.fromJson(Map<String, dynamic> json) =>
      _$StatsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$StatsDTOToJson(this);
}
