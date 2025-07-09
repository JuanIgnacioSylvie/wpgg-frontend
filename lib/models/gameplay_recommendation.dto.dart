import 'package:json_annotation/json_annotation.dart';

part 'gameplay_recommendation.dto.g.dart';

@JsonSerializable()
class GameplayRecommendationDTO {
  GameplayRecommendationDTO({this.role, this.champion, this.summary});

  String? role;
  String? champion;
  String? summary;

  factory GameplayRecommendationDTO.fromJson(Map<String, dynamic> json) =>
      _$GameplayRecommendationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GameplayRecommendationDTOToJson(this);
}
