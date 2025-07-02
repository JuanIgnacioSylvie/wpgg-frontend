// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summoner_spells.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummonerSpellsDTO _$SummonerSpellsDTOFromJson(Map<String, dynamic> json) =>
    SummonerSpellsDTO(
      summoner1Id: (json['summoner1Id'] as num).toInt(),
      summoner2Id: (json['summoner2Id'] as num).toInt(),
      summoner1Casts: (json['summoner1Casts'] as num).toInt(),
      summoner2Casts: (json['summoner2Casts'] as num).toInt(),
    );

Map<String, dynamic> _$SummonerSpellsDTOToJson(SummonerSpellsDTO instance) =>
    <String, dynamic>{
      'summoner1Id': instance.summoner1Id,
      'summoner2Id': instance.summoner2Id,
      'summoner1Casts': instance.summoner1Casts,
      'summoner2Casts': instance.summoner2Casts,
    };
