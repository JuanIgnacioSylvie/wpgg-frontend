import 'package:json_annotation/json_annotation.dart';

import 'participant.dto.dart';
import 'game_mode.dto.dart';

part 'match_summary.dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MatchSummaryDTO {
  MatchSummaryDTO({
    this.matchId,
    this.gameMode,
    this.queueId,
    this.gameDuration,
    this.participants,
    this.gameModeDto,
  });

  String? matchId;
  String? gameMode;
  int? queueId;
  int? gameDuration; // seconds
  List<ParticipantDTO>? participants;
  GameModeDTO? gameModeDto;

  factory MatchSummaryDTO.fromJson(Map<String, dynamic> json) =>
      _$MatchSummaryDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MatchSummaryDTOToJson(this);
}
