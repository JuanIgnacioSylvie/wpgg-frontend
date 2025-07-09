// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_stats.dto.dart';

RoleStatsDTO _$RoleStatsDTOFromJson(Map<String, dynamic> json) => RoleStatsDTO(
      role: json['role'] as String?,
      gamesPlayed: (json['gamesPlayed'] as num?)?.toInt(),
      wins: (json['wins'] as num?)?.toInt(),
      winRate: (json['winRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RoleStatsDTOToJson(RoleStatsDTO instance) =>
    <String, dynamic>{
      'role': instance.role,
      'gamesPlayed': instance.gamesPlayed,
      'wins': instance.wins,
      'winRate': instance.winRate,
    };
