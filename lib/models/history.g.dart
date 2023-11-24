// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      id: json['id'] as int?,
      triggeeId: json['triggeeId'] as int?,
      triggerId: json['triggerId'] as int?,
      type: json['type'] as String?,
      triggee: json['triggee'] == null
          ? null
          : HistoryTriggee.fromJson(json['triggee'] as Map<String, dynamic>),
      trigger: json['trigger'] == null
          ? null
          : HistoryTrigger.fromJson(json['trigger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'id': instance.id,
      'triggerId': instance.triggerId,
      'trigger': instance.trigger,
      'triggeeId': instance.triggeeId,
      'triggee': instance.triggee,
      'type': instance.type,
    };
