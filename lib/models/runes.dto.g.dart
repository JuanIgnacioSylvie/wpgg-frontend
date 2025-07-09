// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'runes.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuneSelectionDTO _$RuneSelectionDTOFromJson(Map<String, dynamic> json) =>
    RuneSelectionDTO(
      perk: (json['perk'] as num?)?.toInt(),
      var1: (json['var1'] as num?)?.toInt(),
      var2: (json['var2'] as num?)?.toInt(),
      var3: (json['var3'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RuneSelectionDTOToJson(RuneSelectionDTO instance) =>
    <String, dynamic>{
      'perk': instance.perk,
      'var1': instance.var1,
      'var2': instance.var2,
      'var3': instance.var3,
    };

RuneStyleDTO _$RuneStyleDTOFromJson(Map<String, dynamic> json) => RuneStyleDTO(
      description: json['description'] as String?,
      selections: (json['selections'] as List<dynamic>?)
          ?.map((e) => RuneSelectionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      style: (json['style'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RuneStyleDTOToJson(RuneStyleDTO instance) =>
    <String, dynamic>{
      'description': instance.description,
      'selections': instance.selections?.map((e) => e.toJson()).toList(),
      'style': instance.style,
    };

RuneStatPerksDTO _$RuneStatPerksDTOFromJson(Map<String, dynamic> json) =>
    RuneStatPerksDTO(
      defense: (json['defense'] as num?)?.toInt(),
      flex: (json['flex'] as num?)?.toInt(),
      offense: (json['offense'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RuneStatPerksDTOToJson(RuneStatPerksDTO instance) =>
    <String, dynamic>{
      'defense': instance.defense,
      'flex': instance.flex,
      'offense': instance.offense,
    };

RunesDTO _$RunesDTOFromJson(Map<String, dynamic> json) => RunesDTO(
      statPerks: json['statPerks'] == null
          ? null
          : RuneStatPerksDTO.fromJson(
              json['statPerks'] as Map<String, dynamic>),
      styles: (json['styles'] as List<dynamic>?)
          ?.map((e) => RuneStyleDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RunesDTOToJson(RunesDTO instance) => <String, dynamic>{
      'statPerks': instance.statPerks?.toJson(),
      'styles': instance.styles?.map((e) => e.toJson()).toList(),
    };
