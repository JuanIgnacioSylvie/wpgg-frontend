import 'package:json_annotation/json_annotation.dart';

part 'profile_account.dto.g.dart';

@JsonSerializable()
class ProfileAccountDTO {
  ProfileAccountDTO({
    this.id,
    this.accountId,
    this.puuid,
    this.revisionDate,
    this.profileIconId,
    this.summonerLevel,
  });

  String? id;
  String? accountId;
  String? puuid;
  int? revisionDate;
  int? profileIconId;
  int? summonerLevel;

  factory ProfileAccountDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileAccountDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileAccountDTOToJson(this);
}
