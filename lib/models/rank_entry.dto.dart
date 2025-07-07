class RankEntryDTO {
  RankEntryDTO(
      {this.tier, this.rank, this.leaguePoints, this.wins, this.losses});

  String? tier;
  String? rank;
  int? leaguePoints;
  int? wins;
  int? losses;

  factory RankEntryDTO.fromJson(Map<String, dynamic> json) => RankEntryDTO(
        tier: json['tier'] as String?,
        rank: json['rank'] as String?,
        leaguePoints: (json['leaguePoints'] as num?)?.toInt(),
        wins: (json['wins'] as num?)?.toInt(),
        losses: (json['losses'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'tier': tier,
        'rank': rank,
        'leaguePoints': leaguePoints,
        'wins': wins,
        'losses': losses,
      };
}
