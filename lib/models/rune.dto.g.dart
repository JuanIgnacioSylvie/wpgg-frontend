// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rune.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuneDTO _$RuneDTOFromJson(Map<String, dynamic> json) => RuneDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$RuneDTOToJson(RuneDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
