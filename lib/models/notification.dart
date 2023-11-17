import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:picme/models/notificationpost.dart';
import 'package:picme/models/notificationtriggee.dart';
import 'package:picme/models/notificationtrigger.dart';
import 'package:picme/models/post.dart';
import 'package:picme/models/profile.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  @JsonKey(name: 'postId')
  final int? postId;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'triggerId')
  final int? triggerId;

  @JsonKey(name: 'trigger')
  final NotificationTrigger? trigger;

  @JsonKey(name: 'triggeeId')
  final int? triggeeId;

  @JsonKey(name: 'triggee')
  final NotificationTriggee? triggee;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'post')
  final NotificationPost? post;

  Notification({
    required this.postId,
    required this.id,
    required this.triggeeId,
    required this.triggerId,
    required this.type,
    required this.post,
    required this.triggee,
    required this.trigger
  });

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
