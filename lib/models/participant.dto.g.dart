// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantDTO _$ParticipantDTOFromJson(Map<String, dynamic> json) =>
    ParticipantDTO(
      championName: json['championName'] as String?,
      kills: (json['kills'] as num?)?.toInt(),
      deaths: (json['deaths'] as num?)?.toInt(),
      assists: (json['assists'] as num?)?.toInt(),
      goldEarned: (json['goldEarned'] as num?)?.toInt(),
      win: json['win'] as bool?,
      accountDto: json['accountDto'] == null
          ? null
          : AccountDTO.fromJson(json['accountDto'] as Map<String, dynamic>),
      summonerSpellsDto: json['summonerSpellsDto'] == null
          ? null
          : SummonerSpellsDTO.fromJson(
              json['summonerSpellsDto'] as Map<String, dynamic>),
      buildDto: json['buildDto'] == null
          ? null
          : BuildDTO.fromJson(json['buildDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParticipantDTOToJson(ParticipantDTO instance) =>
    <String, dynamic>{
      'championName': instance.championName,
      'kills': instance.kills,
      'deaths': instance.deaths,
      'assists': instance.assists,
      'goldEarned': instance.goldEarned,
      'win': instance.win,
      'accountDto': instance.accountDto?.toJson(),
      'summonerSpellsDto': instance.summonerSpellsDto?.toJson(),
      'buildDto': instance.buildDto?.toJson(),
    };
