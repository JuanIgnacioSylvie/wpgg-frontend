// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildDTO _$BuildDTOFromJson(Map<String, dynamic> json) => BuildDTO(
      item0: (json['item0'] as num?)?.toInt(),
      item1: (json['item1'] as num?)?.toInt(),
      item2: (json['item2'] as num?)?.toInt(),
      item3: (json['item3'] as num?)?.toInt(),
      item4: (json['item4'] as num?)?.toInt(),
      item5: (json['item5'] as num?)?.toInt(),
      item6: (json['item6'] as num?)?.toInt(),
      itemsPurchased: (json['itemsPurchased'] as num?)?.toInt(),
      goldSpent: (json['goldSpent'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BuildDTOToJson(BuildDTO instance) => <String, dynamic>{
      'item0': instance.item0,
      'item1': instance.item1,
      'item2': instance.item2,
      'item3': instance.item3,
      'item4': instance.item4,
      'item5': instance.item5,
      'item6': instance.item6,
      'itemsPurchased': instance.itemsPurchased,
      'goldSpent': instance.goldSpent,
    };
