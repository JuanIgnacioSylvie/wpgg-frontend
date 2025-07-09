import 'package:json_annotation/json_annotation.dart';

part 'runes.dto.g.dart';

@JsonSerializable()
class RuneSelectionDTO {
  RuneSelectionDTO({this.perk, this.var1, this.var2, this.var3});

  int? perk;
  int? var1;
  int? var2;
  int? var3;

  factory RuneSelectionDTO.fromJson(Map<String, dynamic> json) =>
      _$RuneSelectionDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RuneSelectionDTOToJson(this);
}

@JsonSerializable()
class RuneStyleDTO {
  RuneStyleDTO({this.description, this.selections, this.style});

  String? description;
  List<RuneSelectionDTO>? selections;
  int? style;

  factory RuneStyleDTO.fromJson(Map<String, dynamic> json) =>
      _$RuneStyleDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RuneStyleDTOToJson(this);
}

@JsonSerializable()
class RuneStatPerksDTO {
  RuneStatPerksDTO({this.defense, this.flex, this.offense});

  int? defense;
  int? flex;
  int? offense;

  factory RuneStatPerksDTO.fromJson(Map<String, dynamic> json) =>
      _$RuneStatPerksDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RuneStatPerksDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RunesDTO {
  RunesDTO({this.statPerks, this.styles});

  RuneStatPerksDTO? statPerks;
  List<RuneStyleDTO>? styles;

  factory RunesDTO.fromJson(Map<String, dynamic> json) =>
      _$RunesDTOFromJson(json);
  Map<String, dynamic> toJson() => _$RunesDTOToJson(this);
}
