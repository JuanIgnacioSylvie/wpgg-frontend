import 'rank_entry.dto.dart';

class PlayerRankDTO {
  PlayerRankDTO({this.rankedSoloQ, this.rankedFlex});

  RankEntryDTO? rankedSoloQ;
  RankEntryDTO? rankedFlex;

  factory PlayerRankDTO.fromJson(Map<String, dynamic> json) => PlayerRankDTO(
        rankedSoloQ: json['rankedSoloQ'] == null
            ? null
            : RankEntryDTO.fromJson(
                json['rankedSoloQ'] as Map<String, dynamic>),
        rankedFlex: json['rankedFlex'] == null
            ? null
            : RankEntryDTO.fromJson(json['rankedFlex'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'rankedSoloQ': rankedSoloQ?.toJson(),
        'rankedFlex': rankedFlex?.toJson(),
      };
}
