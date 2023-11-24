// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historytrigger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryTrigger _$HistoryTriggerFromJson(Map<String, dynamic> json) =>
    HistoryTrigger(
      id: json['id'] as int?,
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$HistoryTriggerToJson(HistoryTrigger instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
    };
