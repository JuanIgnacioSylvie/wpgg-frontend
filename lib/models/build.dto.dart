import 'package:json_annotation/json_annotation.dart';

part 'build.dto.g.dart';

@JsonSerializable()
class BuildDTO {
  BuildDTO({
    required this.item0,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.item4,
    required this.item5,
    required this.item6,
    required this.itemsPurchased,
    required this.goldSpent,
  });

  int item0;
  int item1;
  int item2;
  int item3;
  int item4;
  int item5;
  int item6;
  int itemsPurchased;
  int goldSpent;

  factory BuildDTO.fromJson(Map<String, dynamic> json) =>
      _$BuildDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BuildDTOToJson(this);
}
