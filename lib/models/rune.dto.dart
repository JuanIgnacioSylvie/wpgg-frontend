import 'package:json_annotation/json_annotation.dart';

part 'rune.dto.g.dart';

@JsonSerializable()
class RuneDTO {
  const RuneDTO({required this.id, required this.name, required this.icon});

  final int id;
  final String name;
  final String icon;

  factory RuneDTO.fromJson(Map<String, dynamic> json) =>
      _$RuneDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RuneDTOToJson(this);
}
