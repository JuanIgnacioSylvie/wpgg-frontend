// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rank_entry.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankEntryDTO _$RankEntryDTOFromJson(Map<String, dynamic> json) => RankEntryDTO(
      tier: json['tier'] as String?,
      rank: json['rank'] as String?,
      leaguePoints: (json['leaguePoints'] as num?)?.toInt(),
      wins: (json['wins'] as num?)?.toInt(),
      losses: (json['losses'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RankEntryDTOToJson(RankEntryDTO instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'rank': instance.rank,
      'leaguePoints': instance.leaguePoints,
      'wins': instance.wins,
      'losses': instance.losses,
    };
