import 'package:json_annotation/json_annotation.dart';

part 'profile_account.dto.g.dart';

@JsonSerializable()
class ProfileAccountDTO {
  ProfileAccountDTO({
    required this.id,
    required this.accountId,
    required this.puuid,
    required this.revisionDate,
    required this.profileIconId,
    required this.summonerLevel,
  });

  String id;
  String accountId;
  String puuid;
  int revisionDate;
  int profileIconId;
  int summonerLevel;

  factory ProfileAccountDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileAccountDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileAccountDTOToJson(this);
}
