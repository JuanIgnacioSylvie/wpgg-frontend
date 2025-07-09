// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dto.dart';

StatsDTO _$StatsDTOFromJson(Map<String, dynamic> json) => StatsDTO(
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

Map<String, dynamic> _$StatsDTOToJson(StatsDTO instance) => <String, dynamic>{
      'summary': instance.summary?.toJson(),
      'champions': instance.champions?.map((e) => e.toJson()).toList(),
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
    };
