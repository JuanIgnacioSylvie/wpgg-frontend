import 'package:json_annotation/json_annotation.dart';

part 'build.dto.g.dart';

@JsonSerializable()
class BuildDTO {
  BuildDTO({
    this.item0,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.item5,
    this.item6,
    this.itemsPurchased,
    this.goldSpent,
  });

  int? item0;
  int? item1;
  int? item2;
  int? item3;
  int? item4;
  int? item5;
  int? item6;
  int? itemsPurchased;
  int? goldSpent;

  factory BuildDTO.fromJson(Map<String, dynamic> json) =>
      _$BuildDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BuildDTOToJson(this);
}
