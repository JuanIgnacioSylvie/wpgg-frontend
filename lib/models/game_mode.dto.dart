import 'package:json_annotation/json_annotation.dart';

part 'game_mode.dto.g.dart';

@JsonSerializable()
class GameModeDTO {
  GameModeDTO({
    required this.queueId,
    required this.map,
    this.description,
    this.notes,
  });

  int queueId;
  String map;
  String? description;
  String? notes;

  factory GameModeDTO.fromJson(Map<String, dynamic> json) =>
      _$GameModeDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GameModeDTOToJson(this);
}
