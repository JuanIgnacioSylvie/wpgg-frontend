// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion_stats.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionStatsDTO _$ChampionStatsDTOFromJson(Map<String, dynamic> json) =>
    ChampionStatsDTO(
      championName: json['championName'] as String?,
      gamesPlayed: (json['gamesPlayed'] as num?)?.toInt(),
      wins: (json['wins'] as num?)?.toInt(),
      winRate: (json['winRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ChampionStatsDTOToJson(ChampionStatsDTO instance) =>
    <String, dynamic>{
      'championName': instance.championName,
      'gamesPlayed': instance.gamesPlayed,
      'wins': instance.wins,
      'winRate': instance.winRate,
    };
