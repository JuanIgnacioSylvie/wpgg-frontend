// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_account.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAccountDTO _$ProfileAccountDTOFromJson(Map<String, dynamic> json) =>
    ProfileAccountDTO(
      id: json['id'] as String?,
      accountId: json['accountId'] as String?,
      puuid: json['puuid'] as String?,
      revisionDate: (json['revisionDate'] as num?)?.toInt(),
      profileIconId: (json['profileIconId'] as num?)?.toInt(),
      summonerLevel: (json['summonerLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProfileAccountDTOToJson(ProfileAccountDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accountId': instance.accountId,
      'puuid': instance.puuid,
      'revisionDate': instance.revisionDate,
      'profileIconId': instance.profileIconId,
      'summonerLevel': instance.summonerLevel,
    };
