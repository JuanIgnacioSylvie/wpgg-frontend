import 'package:json_annotation/json_annotation.dart';
import 'rank_entry.dto.dart';

part 'player_rank.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PlayerRankDTO {
  PlayerRankDTO({this.rankedSoloQ, this.rankedFlex});

  RankEntryDTO? rankedSoloQ;
  RankEntryDTO? rankedFlex;

  factory PlayerRankDTO.fromJson(Map<String, dynamic> json) =>
      _$PlayerRankDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerRankDTOToJson(this);
}
