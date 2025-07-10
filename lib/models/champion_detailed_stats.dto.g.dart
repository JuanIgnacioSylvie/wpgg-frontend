// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion_detailed_stats.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionDetailedStatsDTO _$ChampionDetailedStatsDTOFromJson(
        Map<String, dynamic> json) =>
    ChampionDetailedStatsDTO(
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
    );

Map<String, dynamic> _$ChampionDetailedStatsDTOToJson(
        ChampionDetailedStatsDTO instance) =>
    <String, dynamic>{
      'championName': instance.championName,
      'gamesPlayed': instance.gamesPlayed,
      'wins': instance.wins,
      'winRate': instance.winRate,
      'bestBuild': instance.bestBuild?.toJson(),
      'bestRunes': instance.bestRunes?.toJson(),
    };
