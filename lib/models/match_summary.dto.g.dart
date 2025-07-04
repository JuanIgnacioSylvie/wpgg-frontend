// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_summary.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchSummaryDTO _$MatchSummaryDTOFromJson(Map<String, dynamic> json) =>
    MatchSummaryDTO(
      matchId: json['matchId'] as String?,
      gameMode: json['gameMode'] as String?,
      queueId: (json['queueId'] as num?)?.toInt(),
      gameDuration: (json['gameDuration'] as num?)?.toInt(),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => ParticipantDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameModeDto: json['gameModeDto'] == null
          ? null
          : GameModeDTO.fromJson(json['gameModeDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchSummaryDTOToJson(MatchSummaryDTO instance) =>
    <String, dynamic>{
      'matchId': instance.matchId,
      'gameMode': instance.gameMode,
      'queueId': instance.queueId,
      'gameDuration': instance.gameDuration,
      'participants': instance.participants?.map((e) => e.toJson()).toList(),
      'gameModeDto': instance.gameModeDto?.toJson(),
    };
