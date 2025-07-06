class GameplayRecommendationDTO {
  GameplayRecommendationDTO({this.role, this.champion, this.summary});

  String? role;
  String? champion;
  String? summary;

  factory GameplayRecommendationDTO.fromJson(Map<String, dynamic> json) =>
      GameplayRecommendationDTO(
        role: json['role'] as String?,
        champion: json['champion'] as String?,
        summary: json['summary'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'champion': champion,
        'summary': summary,
      };
}
