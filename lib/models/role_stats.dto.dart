class RoleStatsDTO {
  RoleStatsDTO({this.role, this.gamesPlayed, this.wins, this.winRate});

  String? role;
  int? gamesPlayed;
  int? wins;
  double? winRate;

  factory RoleStatsDTO.fromJson(Map<String, dynamic> json) => RoleStatsDTO(
        role: json['role'] as String?,
        gamesPlayed: (json['gamesPlayed'] as num?)?.toInt(),
        wins: (json['wins'] as num?)?.toInt(),
        winRate: (json['winRate'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'role': role,
        'gamesPlayed': gamesPlayed,
        'wins': wins,
        'winRate': winRate,
      };
}
