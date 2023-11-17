// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationtriggee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationTriggee _$NotificationTriggeeFromJson(Map<String, dynamic> json) =>
    NotificationTriggee(
      id: json['id'] as int?,
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$NotificationTriggeeToJson(
        NotificationTriggee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
    };
