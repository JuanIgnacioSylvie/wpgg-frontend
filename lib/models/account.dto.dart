import 'package:json_annotation/json_annotation.dart';

part 'account.dto.g.dart';

@JsonSerializable()
class AccountDTO {
  AccountDTO({
    required this.puuid,
    this.gameName,
    this.tagLine,
  });

  String puuid;
  String? gameName;
  String? tagLine;

  factory AccountDTO.fromJson(Map<String, dynamic> json) =>
      _$AccountDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AccountDTOToJson(this);
}
