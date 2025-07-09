// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_stats.dto.dart';

SummaryStatsDTO _$SummaryStatsDTOFromJson(Map<String, dynamic> json) =>
    SummaryStatsDTO(
      totalGames: (json['totalGames'] as num?)?.toInt(),
      wins: (json['wins'] as num?)?.toInt(),
      losses: (json['losses'] as num?)?.toInt(),
      winRate: (json['winRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SummaryStatsDTOToJson(SummaryStatsDTO instance) =>
    <String, dynamic>{
      'totalGames': instance.totalGames,
      'wins': instance.wins,
      'losses': instance.losses,
      'winRate': instance.winRate,
    };
