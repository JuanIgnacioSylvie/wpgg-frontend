import 'package:json_annotation/json_annotation.dart';

import 'account.dto.dart';
import 'summoner_spells.dto.dart';
import 'build.dto.dart';
import 'runes.dto.dart';

part 'participant.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ParticipantDTO {
  ParticipantDTO({
    this.championName,
    this.kills,
    this.deaths,
    this.assists,
    this.goldEarned,
    this.win,
    this.teamId,
    this.accountDto,
    this.summonerSpellsDto,
    this.buildDto,
    this.runesDto,
  });

  String? championName;
  int? kills;
  int? deaths;
  int? assists;
  int? goldEarned;
  bool? win;

  AccountDTO? accountDto;
  SummonerSpellsDTO? summonerSpellsDto;
  BuildDTO? buildDto;
  RunesDTO? runesDto;
  int? teamId;

  factory ParticipantDTO.fromJson(Map<String, dynamic> json) =>
      _$ParticipantDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantDTOToJson(this);
}
