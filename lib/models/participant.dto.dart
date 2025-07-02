import 'package:json_annotation/json_annotation.dart';

import 'account.dto.dart';
import 'summoner_spells.dto.dart';
import 'build.dto.dart';

part 'participant.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ParticipantDTO {
  ParticipantDTO({
    required this.championName,
    required this.kills,
    required this.deaths,
    required this.assists,
    required this.goldEarned,
    required this.win,
    required this.accountDto,
    required this.summonerSpellsDto,
    required this.buildDto,
  });

  String championName;
  int kills;
  int deaths;
  int assists;
  int goldEarned;
  bool win;

  AccountDTO accountDto;
  SummonerSpellsDTO summonerSpellsDto;
  BuildDTO buildDto;

  factory ParticipantDTO.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantDTOToJson(this);
}
