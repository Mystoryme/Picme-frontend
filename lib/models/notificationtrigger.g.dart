// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationtrigger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationTrigger _$NotificationTriggerFromJson(Map<String, dynamic> json) =>
    NotificationTrigger(
      id: json['id'] as int?,
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$NotificationTriggerToJson(
        NotificationTrigger instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
    };
