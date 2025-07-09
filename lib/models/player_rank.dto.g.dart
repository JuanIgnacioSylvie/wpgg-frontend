// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_rank.dto.dart';

PlayerRankDTO _$PlayerRankDTOFromJson(Map<String, dynamic> json) => PlayerRankDTO(
      rankedSoloQ: json['rankedSoloQ'] == null
          ? null
          : RankEntryDTO.fromJson(json['rankedSoloQ'] as Map<String, dynamic>),
      rankedFlex: json['rankedFlex'] == null
          ? null
          : RankEntryDTO.fromJson(json['rankedFlex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerRankDTOToJson(PlayerRankDTO instance) =>
    <String, dynamic>{
      'rankedSoloQ': instance.rankedSoloQ?.toJson(),
      'rankedFlex': instance.rankedFlex?.toJson(),
    };
