import 'champion_stats.dto.dart';
import 'role_stats.dto.dart';
import 'summary_stats.dto.dart';

class StatsDTO {
  StatsDTO({this.summary, this.champions, this.roles});

  SummaryStatsDTO? summary;
  List<ChampionStatsDTO>? champions;
  List<RoleStatsDTO>? roles;

  factory StatsDTO.fromJson(Map<String, dynamic> json) => StatsDTO(
        summary: json['summary'] == null
            ? null
            : SummaryStatsDTO.fromJson(json['summary'] as Map<String, dynamic>),
        champions: (json['champions'] as List<dynamic>?)
            ?.map((e) => ChampionStatsDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
        roles: (json['roles'] as List<dynamic>?)
            ?.map((e) => RoleStatsDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'summary': summary?.toJson(),
        'champions': champions?.map((e) => e.toJson()).toList(),
        'roles': roles?.map((e) => e.toJson()).toList(),
      };
}
