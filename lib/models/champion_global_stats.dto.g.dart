// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion_global_stats.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionGlobalStatsDTO _$ChampionGlobalStatsDTOFromJson(Map<String, dynamic> json) =>
    ChampionGlobalStatsDTO(
      championName: json['championName'] as String?,
      gamesPlayed: (json['gamesPlayed'] as num?)?.toInt(),
      wins: (json['wins'] as num?)?.toInt(),
      winRate: (json['winRate'] as num?)?.toDouble(),
      bestBuild: json['bestBuild'] == null
          ? null
          : BuildDTO.fromJson(json['bestBuild'] as Map<String, dynamic>),
      bestRunes: json['bestRunes'] == null
          ? null
          : RunesDTO.fromJson(json['bestRunes'] as Map<String, dynamic>),
      bestSpells: json['bestSpells'] == null
          ? null
          : SummonerSpellsDTO.fromJson(json['bestSpells'] as Map<String, dynamic>),
      bestSkillOrder: (json['bestSkillOrder'] as List<dynamic>?)?.map((e) => e as int).toList(),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => RoleStatsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChampionGlobalStatsDTOToJson(ChampionGlobalStatsDTO instance) => <String, dynamic>{
      'championName': instance.championName,
      'gamesPlayed': instance.gamesPlayed,
      'wins': instance.wins,
      'winRate': instance.winRate,
      'bestBuild': instance.bestBuild?.toJson(),
      'bestRunes': instance.bestRunes?.toJson(),
      'bestSpells': instance.bestSpells?.toJson(),
      'bestSkillOrder': instance.bestSkillOrder,
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
    };
