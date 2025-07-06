class SummaryStatsDTO {
  SummaryStatsDTO({this.totalGames, this.wins, this.losses, this.winRate});

  int? totalGames;
  int? wins;
  int? losses;
  double? winRate;

  factory SummaryStatsDTO.fromJson(Map<String, dynamic> json) => SummaryStatsDTO(
        totalGames: (json['totalGames'] as num?)?.toInt(),
        wins: (json['wins'] as num?)?.toInt(),
        losses: (json['losses'] as num?)?.toInt(),
        winRate: (json['winRate'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'totalGames': totalGames,
        'wins': wins,
        'losses': losses,
        'winRate': winRate,
      };
}
