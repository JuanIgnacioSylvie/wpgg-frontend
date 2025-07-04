// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_mode.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModeDTO _$GameModeDTOFromJson(Map<String, dynamic> json) => GameModeDTO(
      queueId: (json['queueId'] as num?)?.toInt(),
      map: json['map'] as String?,
      description: json['description'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$GameModeDTOToJson(GameModeDTO instance) =>
    <String, dynamic>{
      'queueId': instance.queueId,
      'map': instance.map,
      'description': instance.description,
      'notes': instance.notes,
    };
