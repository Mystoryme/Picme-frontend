// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      postId: json['postId'] as int?,
      id: json['id'] as int?,
      triggeeId: json['triggeeId'] as int?,
      triggerId: json['triggerId'] as int?,
      type: json['type'] as String?,
      post: json['post'] == null
          ? null
          : NotificationPost.fromJson(json['post'] as Map<String, dynamic>),
      triggee: json['triggee'] == null
          ? null
          : NotificationTriggee.fromJson(
              json['triggee'] as Map<String, dynamic>),
      trigger: json['trigger'] == null
          ? null
          : NotificationTrigger.fromJson(
              json['trigger'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.id,
      'triggerId': instance.triggerId,
      'trigger': instance.trigger,
      'triggeeId': instance.triggeeId,
      'triggee': instance.triggee,
      'type': instance.type,
      'post': instance.post,
    };
