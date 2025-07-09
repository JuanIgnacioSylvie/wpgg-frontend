import 'package:json_annotation/json_annotation.dart';

part 'role_stats.dto.g.dart';

@JsonSerializable()
class RoleStatsDTO {
  RoleStatsDTO({this.role, this.gamesPlayed, this.wins, this.winRate});

  String? role;
  int? gamesPlayed;
  int? wins;
  double? winRate;

  factory RoleStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$RoleStatsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RoleStatsDTOToJson(this);
}
