// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameplay_recommendation.dto.dart';

GameplayRecommendationDTO _$GameplayRecommendationDTOFromJson(
        Map<String, dynamic> json) =>
    GameplayRecommendationDTO(
      role: json['role'] as String?,
      champion: json['champion'] as String?,
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$GameplayRecommendationDTOToJson(
        GameplayRecommendationDTO instance) =>
    <String, dynamic>{
      'role': instance.role,
      'champion': instance.champion,
      'summary': instance.summary,
    };
