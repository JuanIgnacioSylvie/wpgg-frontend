import 'package:json_annotation/json_annotation.dart';

part 'rank_entry.dto.g.dart';

@JsonSerializable()
class RankEntryDTO {
  RankEntryDTO(
      {this.tier, this.rank, this.leaguePoints, this.wins, this.losses});

  String? tier;
  String? rank;
  int? leaguePoints;
  int? wins;
  int? losses;

  factory RankEntryDTO.fromJson(Map<String, dynamic> json) =>
      _$RankEntryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RankEntryDTOToJson(this);
}
