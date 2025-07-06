class ChampionStatsDTO {
  ChampionStatsDTO({this.championName, this.gamesPlayed, this.wins, this.winRate});

  String? championName;
  int? gamesPlayed;
  int? wins;
  double? winRate;

  factory ChampionStatsDTO.fromJson(Map<String, dynamic> json) => ChampionStatsDTO(
        championName: json['championName'] as String?,
        gamesPlayed: (json['gamesPlayed'] as num?)?.toInt(),
        wins: (json['wins'] as num?)?.toInt(),
        winRate: (json['winRate'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'championName': championName,
        'gamesPlayed': gamesPlayed,
        'wins': wins,
        'winRate': winRate,
      };
}
